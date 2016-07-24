var app = angular.module('students',['ngRoute', 'templates']);

var StudentSearchController = function($scope, $http, $location) {
  $scope.viewDetails = function(student){
    $location.path("/" + student.id)
  }

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
  [ "$scope", "$http", "$location", StudentSearchController ]
);

app.controller("StudentDetailController", [
  "$scope", "$http", "$routeParams",
  function($scope, $http, $routeParams){
    var studentId = $routeParams.id;
    $scope.students = {}

    $http.get(
      "/students/" + studentId + ".json"
    ).then(function(response){
      $scope.student = response.data;
    }, function(response) {
      alert("There was a problem: " + response.status)
    });
  }
])

app.config([
  "$routeProvider",
  function($routeProvider){
    $routeProvider.when("/", {
      controller: "StudentSearchController",
      templateUrl: "student_search.html"
    }).when("/:id", {
      controller: "StudentDetailController",
      templateUrl: "student_detail.html"
    });
  }
])
