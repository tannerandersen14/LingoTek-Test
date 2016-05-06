angular.module('phone-book').controller 'mainCtrl', ['$scope', '$localStorage', ($scope, $localStorage) ->
  $scope.test = '123 344 9302'
  console.log $scope.test.replace(/\s/g, '')
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
    if $scope.newContact.phoneNumber.replace(/-/g, '').length == 10
      $scope.newContact.phoneNumber = $scope.newContact.phoneNumber.replace(/-/g, '')
      $scope.newContact.phoneNumber = $scope.newContact.phoneNumber.slice(0, 3) + '-' + $scope.newContact.phoneNumber.slice(3, 6) + '-' + $scope.newContact.phoneNumber.slice(6, 10)
    else if $scope.newContact.phoneNumber.replace(/\s/g, '').length == 10
      $scope.newContact.phoneNumber = $scope.newContact.phoneNumber.replace(/\s/g, '')
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
          if editedContact.phoneNumber.replace(/-/g, '').length == 10
            editedContact.phoneNumber = editedContact.phoneNumber.replace(/-/g, '')
            editedContact.phoneNumber = editedContact.phoneNumber.slice(0, 3) + '-' + editedContact.phoneNumber.slice(3, 6) + '-' + editedContact.phoneNumber.slice(6, 10)
          else if editedContact.phoneNumber.replace(/\s/g, '').length == 10
            editedContact.phoneNumber = editedContact.phoneNumber.replace(/\s/g, '')
            editedContact.phoneNumber = editedContact.phoneNumber.slice(0, 3) + '-' + editedContact.phoneNumber.slice(3, 6) + '-' + editedContact.phoneNumber.slice(6, 10)
          else if editedContact.phoneNumber.length == 10
            editedContact.phoneNumber = editedContact.phoneNumber.slice(0, 3) + '-' + editedContact.phoneNumber.slice(3, 6) + '-' + editedContact.phoneNumber.slice(6, 10)
          else
            alert 'Invalid phone number.'
            editedContact.phoneNumber = ''
            return
          originalContact.phoneNumber = editedContact.phoneNumber
          editedContact.phoneNumber = ''
        if editedContact.firstName
          editedContact.firstName.charAt(0).toUpperCase()
          originalContact.firstName = editedContact.firstName
          editedContact.firstName = ''
        if editedContact.lastName
          editedContact.lastName.charAt(0).toUpperCase()
          originalContact.lastName = editedContact.lastName
          editedContact.lastName = ''
        if editedContact.email
          originalContact.email = editedContact.email
          editedContact.email = ''
        $localStorage.contactArray[i] = originalContact
      i++
    return
  $scope.populateView = (contact) ->
    $scope.contactArray = $localStorage.contactArray
    $scope.viewContact = contact
  $scope.logStorage = ->
    console.log $localStorage.contactArray
]
