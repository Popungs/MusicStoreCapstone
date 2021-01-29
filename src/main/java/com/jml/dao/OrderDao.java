package com.jml.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.jml.model.Order;
@Repository
public interface OrderDao extends JpaRepository<Order,Long> {

}
