import {AfterViewInit, Component, ViewChild} from '@angular/core';
import {MatTableDataSource} from '@angular/material/table';
import {MatPaginator} from '@angular/material/paginator';
import {ApiService} from "../../services/api.service";

@Component({
  selector: 'app-usuarios-tabla',
  templateUrl: './usuarios-tabla.component.html',
  styleUrls: ['./usuarios-tabla.component.css'],
})
export class UsuariosTablaComponent implements AfterViewInit {

  users: any;

  dataSource: MatTableDataSource<any>;
  displayedColumns: string[] = ['id', 'name', 'username', 'email', 'website'];


  @ViewChild(MatPaginator) paginator: MatPaginator;

  constructor(private apiService: ApiService) { }

  ngAfterViewInit(): void {
    this.apiService.getUsers().subscribe(data => {
      this.users = data;
      this.dataSource = new MatTableDataSource(this.users);
      this.dataSource.paginator = this.paginator;
    })
  }

}
