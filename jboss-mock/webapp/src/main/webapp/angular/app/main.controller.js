(function () {
    'use strict';
  
    angular.module('demoApp', [])
      .controller('MainController', ['$scope', function ($scope) {
        $scope.title = '🚀 AngularJS 1.3.17 Demo Page';
        $scope.userInput = '';
        $scope.items = ['banana', 'apple', 'mongo'];
  
        $scope.addItem = function () {
          $scope.items.push('new item ' + ($scope.items.length + 1));
        };
      }]);
  })();
  