import { Component, OnInit } from '@angular/core';
import {ApiService} from "../../services/api.service";

@Component({
  selector: 'app-usuarios-lista',
  templateUrl: './usuarios-lista.component.html',
  styleUrls: ['./usuarios-lista.component.css']
})
export class UsuariosListaComponent implements OnInit {

  users: any;
  usuarioSeleccionado: any;

  constructor(private apiService: ApiService) { }

  ngOnInit(): void {
    this.apiService.getUsers().subscribe(data => {
      this.users = data;
    })
  }

  seleccionarUsuario(usuario){
    this.usuarioSeleccionado = usuario;
  }

}
