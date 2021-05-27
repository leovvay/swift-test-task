# Тестовое задание Swift Test Quest

Вам следует разработать swift-приложение состоящее из двух скринов (авторизация, мейн скрин)


Авторизация: 
  -  2 инпута (логин пароль)
  - Кнопка accept
Мейн скрин:
- Какойто лэндинг с цветным фоном

Implement main page based on UICollectionView with a list of images. It may works like SpringBoard 7x10 (add 2 pt between images) on iPhone with horizontal pagination.
The top bar should contain two buttons: “+” and “Reload All”.
On “+” button it should add a new image to the end of the list.
Reload all function should remove all existing images and load 140 new. Images should be rounded with corner radius = 7.
Collection should scroll without any lags or freezes and be smooth. Also you need to appear activity indicator for cell if image not loaded yet.
You can get new images by executing this request http://loremflickr.com/200/200

You should use reactive extensions, when working with collectin view

Условия:
Написать ios приложение с использованием следующих требований:
  - Coordinator pattern + MVVM
  - RxSwift и Moya для запроса на авторизацию по нажатию на кнопку (фейковый запрос, хоть на google.com) 
  - После успешного запроса юзер попадает на мейн скрин

Как засабмитать мое задание? 
Откройте форк и сделайте ПР в этот репозиторий.
