var app = angular.module('myApp', []);
app.controller('MainCtrl', function($scope) {
  $scope.users = [
    { name: "sasaki", age: "31" },
    { name: "tanaka", age: "26" },
    { name: "yamada", age: "30" }
  ];
});
