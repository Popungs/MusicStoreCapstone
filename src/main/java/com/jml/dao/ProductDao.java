package com.jml.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import org.springframework.stereotype.Repository;

import com.jml.model.Product;
@Repository
public interface ProductDao extends JpaRepository<Product, Long>{

}
