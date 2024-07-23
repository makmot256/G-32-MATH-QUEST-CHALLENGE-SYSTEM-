<x-layout bodyClass="g-sidenav-show  bg-gray-200">
    <x-navbars.sidebar activePage='dashboard'></x-navbars.sidebar>
    <main class="main-content position-relative max-height-vh-100 h-100 border-radius-lg ">
        <!-- Navbar -->
        <x-navbars.navs.auth titlePage="Dashboard"></x-navbars.navs.auth>
        <!-- End Navbar -->
        <div class="container-fluid py-4">
            <div class="row">
                <div class="col-xl-12 col-sm-6 mb-xl-0 mb-4">
                    <div class="card">
                        <div class="card-header p-3 pt-2">
                            <div
                                class="icon icon-lg icon-shape bg-gradient-dark shadow-dark text-center border-radius-xl mt-n4 position-absolute">
                                <i class="material-icons opacity-10">weekend</i>
                            </div>

                            <!-- Iam editing this div alone  -->
                            <div class="text-start pt-6" class="row"  class="col-lg-div class="col-lg-15 col-md-6 mb-md-0 mb-4">
                                <p class="text-sm mb-0 text-capitalize"></p>
                                <h4 class="mb-13">
                                    WELCOME TO THE MATH QUEST CHALLENGE
                                </h4>
                                <br>
                                <h5 class="mb-0">
                                    Providing the best Challenges for Primary School Students
                                </h5>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</x-layout>