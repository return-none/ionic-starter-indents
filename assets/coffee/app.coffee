angular.module('indents.controllers', [])
angular.module('indents.services', [])
angular.module('indents.directives', [])
angular.module('indents.filters', [])

angular.module('indents', [
    'ionic',
    'indents.controllers',
    'indents.services',
    'indents.directives',
    'indents.filters'
])
.run([
    '$window',
    '$ionicPlatform',
    ($window, $ionicPlatform) ->
        if $window.cordova and $window.cordova.plugins.Keyboard
            cordova.plugins.Keyboard.hideKeyboardAccessoryBar(true)

        if $window.StatusBar
            StatusBar.styleDefault()

        return
])
.config([
    '$stateProvider',
    '$urlRouterProvider',
    ($stateProvider, $urlRouterProvider) ->
        $stateProvider.state 'index',
            url: '',
            templateUrl: 'templates/index.html',
            controller: 'IndexCtrl'

        $urlRouterProvider.otherwise('');

        return
])
