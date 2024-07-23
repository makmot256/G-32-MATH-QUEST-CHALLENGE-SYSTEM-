<x-layout bodyClass="">
    <div class="container position-sticky z-index-sticky top-0">
        <div class="row">
            <div class="col-12">
                <x-navbars.navs.guest signup='register' signin='login'></x-navbars.navs.guest>
            </div>
        </div>
    </div>
    <div class="page-header justify-content-center min-vh-100"
        style="background-image: url('myImage.jpg');">
        <span class="mask bg-gradient-dark opacity-6"></span>
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-6 col-md-8 col-sm-10 text-center">
                    <h1 class="text-light">Welcome to the Math Quest Challenge System</h1>
                    <p class="text-light mt-3">The journey to conquering math starts here. Register or log in to get started!</p>
                    <a href="{{ route('register') }}" class="btn btn-primary btn-lg mt-3">Register</a>
                    <a href="{{ route('login') }}" class="btn btn-secondary btn-lg mt-3">Log In</a>
                </div>
            </div>
        </div>
    </div>
    <x-footers.guest></x-footers.guest>
</x-layout>