import { RouterModule, Routes } from '@angular/router';
import { ViewProfileComponent } from './pages/view-profile/view-profile.component';
import { NgModule } from '@angular/core';
import { AppComponent } from './app.component';
import { ViewPostsRegisteredComponent } from './pages/view-posts-registered/view-posts-registered.component';

export const routes: Routes = [
    { path: 'view-profile', component: ViewProfileComponent },
    { path: 'view-posts', component: ViewPostsRegisteredComponent },
];
@NgModule({
    imports: [RouterModule.forRoot(routes)],
    exports: [RouterModule]
  })
  export class AppRoutingModule { }