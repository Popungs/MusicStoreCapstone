package com.jml.service;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.jml.dao.CardDao;
import com.jml.dao.UserDao;
import com.jml.model.Card;
import com.jml.model.User;

import net.bytebuddy.asm.Advice.This;

@Service
@Transactional
public class UserService {
	@Autowired
	private UserDao userDao;

	@Autowired
	private CardDao cardDao;

	public List<User> getAllUser() {
		List<User> rLi = (List<User>) userDao.findAll();
		return rLi;
	}

	public boolean createUser(String userName, String password, String role, List<Card> cards) {
		User newUser = new User();
		newUser.setUsername(userName);
		newUser.setPassword(password);
		if (role == null) {
			role = "user";
		}
		newUser.setRole(role);

		if (!cards.isEmpty()) {
			newUser.setCards(cards);
		}

		System.out.print(this.getAllUser().size());
		if (this.getAllUser().size() == 0) {
			userDao.save(newUser);
			return true;
		} else {

			for (User u : userDao.findAll()) {
				if (u.getUsername().equals(userName)) {
					return false;
				}
			}

			userDao.save(newUser);
			if (newUser.getCards() != null) {
				newUser.getCards().forEach(card -> {
					card.setUser(newUser);
					cardDao.save(card);
				});
			}
			return true;
		}

	}

	public User authentication(String name, String pass) {
		Optional<User> u = this.getAllUser().stream()
				.filter(e -> e.getUsername().equals(name) && e.getPassword().equals(pass)).findAny();
		if (u.isPresent()) {
			User currUser = u.get();
		
			return currUser;
		} else {
			User dummy = new User();
			return dummy;
		}

	}

	public User getUserById(Long id) {
		Optional<User> u = userDao.findById(id);
		if (u.isPresent()) {
			return u.get();
		} else {
			// user is not present
			User dummy = new User();
			return dummy;
		}
	}

	public void updateUser(User u) {
//		Long targetId = u.getId();
//		this.deleteUser(targetId);
		
		userDao.delete(u);	
		if (!u.getCards().isEmpty()) {
			u.getCards().forEach(card -> {
				card.setUser(u);
				cardDao.save(card);
			});
		}
		userDao.flush();
		userDao.save(u);
	}

	public boolean deleteUser(Long id) {

		Optional<User> u = userDao.findById(id);
		if (u.isPresent()) {
			User target = u.get();
			if (target.getCards() != null) {
				target.getCards().forEach(card -> {
					cardDao.delete(card);
				});
			}
			userDao.deleteById(id);
			return true;
		} else {
			return false;
		}
	}

}
