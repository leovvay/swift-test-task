# Тестовое задание Swift Test Quest

Вам следует разработать swift-приложение состоящее из двух скринов (авторизация, мейн скрин)


Авторизация: 
  -  2 инпута (логин пароль)
  - Кнопка accept
  - После успешного запроса юзер попадает на мейн скрин
Мейн скрин:
  - Implement main page based on UICollectionView with a list of images and horizontal pagination. The top bar should contain two buttons: “+” and “Reload All”.
On “+” button it should add a new image to the end of the list. Reload all function should remove all existing images and load new. Images should be rounded with corner radius = 7. Also you need to appear activity indicator for cell if image not loaded yet. You can get new images by executing this request http://loremflickr.com/200/200

Будет плюсом написать приложение с использованием следующих требований:
  - Coordinator pattern
  - RxSwift
  - Moya для запросов (авторизация - фейковый запрос, хоть на google.com) 

Как засабмитать мое задание?
Откройте форк и сделайте ПР в этот репозиторий.
