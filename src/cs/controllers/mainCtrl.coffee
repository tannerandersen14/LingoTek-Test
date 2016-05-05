angular.module('phone-book').controller 'mainCtrl', ['$scope', '$localStorage', ($scope, $localStorage) ->
  $scope.newContact = {}
  $scope.contactArray = $localStorage.contactArray
  if !$localStorage.contactArray
    $localStorage.contactArray = []
  console.log($localStorage.contactArray)
  $scope.addContact = ->
    if $localStorage.contactArray.includes $scope.newContact
      console.log 'Contact already exists.'
      $scope.newContact = {}
      return
    $scope.newContact = {}
    console.log $localStorage.contactArray
  $scope.deleteContact = (contact) ->
    i = 0
    while i < $localStorage.contactArray.length
      if contact == $localStorage.contactArray[i]
        $localStorage.contactArray.splice i, 1
      i++
]
