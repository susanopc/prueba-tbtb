import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import {UsuariosListaComponent} from "./components/usuarios-lista/usuarios-lista.component";
import {UsuariosTablaComponent} from "./components/usuarios-tabla/usuarios-tabla.component";

const routes: Routes = [
  {
    path: 'tabla',
    component: UsuariosTablaComponent
  },
  {
    path: 'lista',
    component: UsuariosListaComponent
  },
  {
    path: '**',
    redirectTo: '/tabla',
  }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
