var = myApp = angular.module('myApp'); // sample_service.jsで定義したmoduleを取得
myApp.controller('MyCtrl', ['$scope','greetService',function($scope, greetService){
  $scope.greet = greetService.message;
}]);
