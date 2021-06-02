<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('admin', 'loginController@adminIndex')->name('admin.login');
Route::post('admin', 'loginController@adminPosted');

Route::group(['middleware' => 'admin'], function(){
    Route::get("/admin_panel", 'admin_panel\dashboardController@index')->name('admin.dashboard');
    Route::get('admin/logout', 'loginController@adminLogout')->name('admin.logout');
    //categories
    Route::get('/admin_panel/categories', 'admin_panel\categoriesController@index')->name('admin.categories');
    Route::post('/admin_panel/categories', 'admin_panel\categoriesController@posted');

    Route::get('/admin_panel/categories/edit/{id}', 'admin_panel\categoriesController@edit')->name('admin.categories.edit');
    Route::post('/admin_panel/categories/edit/{id}', 'admin_panel\categoriesController@update');

    Route::get('/admin_panel/categories/delete/{id}', 'admin_panel\categoriesController@delete')->name('admin.categories.delete');
    Route::post('/admin_panel/categories/delete/{id}', 'admin_panel\categoriesController@destroy');

    //products
    Route::get('/admin_panel/products', 'admin_panel\productsController@index')->name('admin.products');

    Route::get('/admin_panel/products/create', 'admin_panel\productsController@create')->name('admin.products.create');
    Route::post('/admin_panel/products/create', 'admin_panel\productsController@store');

    Route::get('/admin_panel/products/edit/{id}', 'admin_panel\productsController@edit')->name('admin.products.edit');
    Route::post('/admin_panel/products/edit/{id}', 'admin_panel\productsController@update');

    Route::get('/admin_panel/products/delete/{id}', 'admin_panel\productsController@delete')->name('admin.products.delete');
    Route::post('/admin_panel/products/delete/{id}', 'admin_panel\productsController@destroy');

    //order management
    Route::get('/admin_panel/management', 'admin_panel\managementController@manage')->name('admin.orderManagement');
    Route::post('/admin_panel/management', 'admin_panel\managementController@update')->name('admin.orderUpdate');

    //Prescription
    Route::get('/admin_panel/prescription', 'admin_panel\PrescriptionController@index')->name('admin.prescription');
    Route::get('/admin_panel/prescription/{id}', 'admin_panel\PrescriptionController@show')->name('admin.prescription.show');
    Route::get('/admin_panel/prescription/{id}/delete', 'admin_panel\PrescriptionController@destroy')->name('admin.prescription.delete');

    //media
    Route::get('/admin_panel/media', 'admin_panel\MediaController@index')->name('admin.media');
    Route::post('/admin_panel/media', 'admin_panel\MediaController@store')->name('admin.store');
    Route::get('/admin_panel/media/delete/{id}', 'admin_panel\MediaController@destroy')->name('admin.media.delete');

    //composition
    Route::get('/admin_panel/composition', 'admin_panel\CompositionController@index')->name('admin.composition');
    Route::post('/admin_panel/composition', 'admin_panel\CompositionController@store')->name('admin.composition.store');
    Route::get('/admin_panel/composition/{composition}', 'admin_panel\CompositionController@edit')->name('admin.composition.edit');
    Route::post('/admin_panel/composition/{composition}', 'admin_panel\CompositionController@update')->name('admin.composition.update');
    Route::get('/admin_panel/composition/delete/{composition}', 'admin_panel\CompositionController@destroy')->name('admin.composition.delete');

    //Requested medicines
    Route::get('/admin_panel/requested-medicine', 'admin_panel\MedicineRequestController@index')->name('admin.medicine-request');

    //Notifications
    Route::get('/admin_panel/notifications', 'admin_panel\NotificationController@index')->name('admin.notifications');
    Route::post('/admin_panel/notifications', 'admin_panel\NotificationController@store')->name('admin.notifications.store');
    Route::get('/admin_panel/notifications/edit/{notification}', 'admin_panel\NotificationController@edit')->name('admin.notifications.edit');
    Route::post('/admin_panel/notifications/update/{notification}', 'admin_panel\NotificationController@update')->name('admin.notifications.update');
    Route::get('/admin_panel/notifications/delete/{notification}', 'admin_panel\NotificationController@destroy')->name('admin.notifications.delete');
});

Route::get('/login', 'loginController@userIndex')->name('user.login');
Route::post('/login', 'loginController@userPosted');

//signup
Route::get('/signup', 'signupController@userIndex')->name('user.signup');
Route::post('/signup', 'signupController@userPosted');
Route::post('/check_email', 'signupController@emailCheck')->name('user.signup.check_email');


//user
Route::get('/', 'user\userController@index')->name('user.home');
Route::get('/product/{id}', 'user\userController@view')->name('user.product');

Route::get('/search', 'user\userController@search')->name('user.search');
Route::get('/search?c={id}', 'user\userController@view')->name('user.search.cat');



Route::get('/view/{id}', 'user\userController@view')->name('user.view');
Route::post('/view/{id}', 'user\userController@post');

Route::get('/cart', 'user\userController@cart')->name('user.cart');
Route::post('/cart', 'user\userController@confirm');

Route::post('/edit_cart', 'user\userController@editCart')->name('user.editCart');
Route::post('/delete_item_from_cart', 'user\userController@deleteCartItem')->name('user.deleteCartItem');


Route::get('/logout', 'loginController@userLogout')->name('user.logout');

Route::group(['middleware' => 'user'], function(){
Route::get('/history', 'user\userController@history')->name('user.history');
});
