package com.jml.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import org.springframework.stereotype.Repository;

import com.jml.model.Card;
@Repository
public interface CardDao extends JpaRepository<Card,Long>{

}
