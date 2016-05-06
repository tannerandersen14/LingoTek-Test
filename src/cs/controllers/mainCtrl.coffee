angular.module('phone-book').controller 'mainCtrl', ['$scope', '$localStorage', ($scope, $localStorage) ->
  if !$localStorage.contactArray
    $localStorage.contactArray = []
  $scope.contactArray = $localStorage.contactArray
  console.log($localStorage.contactArray)
  $scope.addContact = ->
    if $localStorage.contactArray.includes $scope.newContact
      console.log 'Contact already exists.'
      $scope.newContact = {}
      return
    $scope.newContact.firstName.charAt(0).toUpperCase()
    $scope.newContact.lastName.charAt(0).toUpperCase()
    if $scope.newContact.phoneNumber.slice('-').length == 10
      $scope.newContact.phoneNumber = $scope.newContact.phoneNumber.slice('-')
      $scope.newContact.phoneNumber = $scope.newContact.phoneNumber.slice(0, 3) + '-' + $scope.newContact.phoneNumber.slice(3, 6) + '-' + $scope.newContact.phoneNumber.slice(6, 10)
    else if $scope.newContact.phoneNumber.slice(' ').length == 10
      $scope.newContact.phoneNumber = $scope.newContact.phoneNumber.slice(' ')
      $scope.newContact.phoneNumber = $scope.newContact.phoneNumber.slice(0, 3) + '-' + $scope.newContact.phoneNumber.slice(3, 6) + '-' + $scope.newContact.phoneNumber.slice(6, 10)
    else if $scope.newContact.phoneNumber.length == 10
      $scope.newContact.phoneNumber = $scope.newContact.phoneNumber.slice(0, 3) + '-' + $scope.newContact.phoneNumber.slice(3, 6) + '-' + $scope.newContact.phoneNumber.slice(6, 10)
    else
      alert 'Invalid phone number.'
      $scope.newContact.phoneNumber = ''
      return
    $localStorage.contactArray.push $scope.newContact
    $scope.newContact = {}
  $scope.deleteContact = (contact) ->
    i = 0
    while i < $localStorage.contactArray.length
      if contact == $localStorage.contactArray[i]
        $localStorage.contactArray.splice i, 1
      i++
  $scope.populateEdit = (contact) ->
    $scope.editViewContact = contact
  $scope.editContact = (originalContact, editedContact) ->
    i = 0
    while i < $localStorage.contactArray.length
      if originalContact == $localStorage.contactArray[i]
        if editedContact.phoneNumber
          originalContact.phoneNumber = editedContact.phoneNumber
        if editedContact.firstName
          originalContact.firstName = editedContact.firstName
        if editedContact.lastName
          originalContact.lastName = editedContact.lastName
        if editedContact.email
          originalContact.email = editedContact.email
        $localStorage.contactArray[i] = originalContact

  $scope.populateView = (contact) ->
    $scope.contactArray = $localStorage.contactArray
    $scope.viewContact = contact
  $scope.logStorage = ->
    console.log $localStorage.contactArray
]
