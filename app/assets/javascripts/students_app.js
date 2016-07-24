var app = angular.module('students',['ui.bootstrap']);

var StudentSearchController = function($scope, $http) {
  $scope.search = function(searchTerm) {
    $http.get("/students.json",
        { "params" : { "keywords" : searchTerm } }
    ).then(function(response) {
      $scope.students = response.data;
    }, function(response){
      alert("There was a problem: " + response.status);
      }
    );
  }
}

app.controller("StudentSearchController",
  [ "$scope", "$http", StudentSearchController ]
);

