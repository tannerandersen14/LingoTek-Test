angular.module('phone-book').controller 'mainCtrl', ['$scope', '$localStorage', ($scope, $localStorage) ->
  $scope.data = 'This is data here yes?'
  $localStorage.hello = 'Hello there this is from local storage'
  $scope.localStorageData = $localStorage.hello
]
