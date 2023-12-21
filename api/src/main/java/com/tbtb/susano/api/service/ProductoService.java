package com.tbtb.susano.api.service;

import com.tbtb.susano.api.model.Producto;

import java.util.List;
import java.util.Optional;

public interface ProductoService {
    Producto create(Producto producto);
    List<Producto> findAll();
    Optional<Producto> findById(Long idProducto);
    Producto update(Producto producto);
    void delete(Long idProducto);
}
