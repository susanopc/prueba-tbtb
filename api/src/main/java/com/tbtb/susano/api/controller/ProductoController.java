package com.tbtb.susano.api.controller;

import com.tbtb.susano.api.model.Producto;
import com.tbtb.susano.api.service.ProductoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/productos")
public class ProductoController {

    private final ProductoService productoService;

    @Autowired
    public ProductoController(ProductoService productoService) {
        this.productoService = productoService;
    }

    @PostMapping
    public ResponseEntity<Producto> create(@RequestBody Producto producto){
        return new ResponseEntity<>(productoService.create(producto), HttpStatus.CREATED);
    }

    @GetMapping
    public ResponseEntity<List<Producto>> findAll(){
        return new ResponseEntity<>(productoService.findAll(), HttpStatus.OK);
    }

    @GetMapping("/{idProducto}")
    public ResponseEntity<Producto> findById(@PathVariable Long idProducto){
        Optional<Producto> productoOpt = productoService.findById(idProducto);
        if(productoOpt.isPresent()){
            return new ResponseEntity<>(productoOpt.get(), HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @PutMapping("/{idProducto}")
    public ResponseEntity<Producto> update(@PathVariable Long idProducto, @RequestBody Producto producto){
        Optional<Producto> productoOpt = productoService.findById(idProducto);
        if(productoOpt.isPresent()){
            producto.setIdProducto(idProducto);
            return new ResponseEntity<>(productoService.update(producto), HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @DeleteMapping("/{idProducto}")
    public ResponseEntity<Void> delete(@PathVariable Long idProducto){
        Optional<Producto> productoOpt = productoService.findById(idProducto);
        if(productoOpt.isPresent()){
            productoService.delete(idProducto);
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }
}
