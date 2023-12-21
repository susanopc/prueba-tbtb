package com.tbtb.susano.api.repository;

import com.tbtb.susano.api.model.Producto;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ProductoRepository extends JpaRepository<Producto, Long> {
}
