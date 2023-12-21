package com.tbtb.susano.api.service.impl;

import com.tbtb.susano.api.model.Producto;
import com.tbtb.susano.api.repository.ProductoRepository;
import com.tbtb.susano.api.service.ProductoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ProductoServiceImpl implements ProductoService {

    private final ProductoRepository productoRepository;

    @Autowired
    public ProductoServiceImpl(ProductoRepository productoRepository) {
        this.productoRepository = productoRepository;
    }

    @Override
    public Producto create(Producto producto) {
        return productoRepository.save(producto);
    }

    @Override
    public List<Producto> findAll() {
        return productoRepository.findAll();
    }

    @Override
    public Optional<Producto> findById(Long idProducto) {
        return productoRepository.findById(idProducto);
    }

    @Override
    public Producto update(Producto producto) {
        return productoRepository.save(producto);
    }

    @Override
    public void delete(Long idProducto) {
        productoRepository.deleteById(idProducto);
    }
}
