angular.module 'phone-book', ['ui.router', 'ngStorage']

angular.module('phone-book').config ['$stateProvider', '$urlRouterProvider', ($stateProvider, $urlRouterProvider) ->
  $stateProvider
  .state 'home',
    url: '/'
    templateUrl: '/home.html'
    controller: 'mainCtrl'
  .state 'book',
    url: '/book'
    templateUrl: '/book.html'
    controller: 'mainCtrl'
  $urlRouterProvider.otherwise('/')
]
