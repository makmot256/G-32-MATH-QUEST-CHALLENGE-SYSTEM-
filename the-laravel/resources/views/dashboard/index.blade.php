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
                                    Providing the best Challenges for Primary School Pupils.
                                </h5>
                            </div>
                        </div>


                        <hr class="dark horizontal my-0">
                        <div class="card-footer p-3">
                            <p class="mb-0"><span class="text-success text-sm font-weight-bolder">THE BEST CHALLENGES   </span>to keep your child mentally alert.
                            </p>
                        </div>
                    </div>
                </div>



                <div class="row mt-4">
                <div class="col-xl-4 col-sm-6 mb-xl-0 mb-4">
                    <div class="card">
                        <div class="card-header p-3 pt-2">
                            <div
                                class="icon icon-lg icon-shape bg-gradient-primary shadow-primary text-center border-radius-xl mt-n4 position-absolute">
                                <i class="material-icons opacity-10">person</i>
                            </div>
                            <div class="text-end pt-1">
                                <p class="text-sm mb-0 text-capitalize">SCHOLARSHIPS</p>
                                <h4 class="mb-0">About 200+ available</h4>
                            </div>
                        </div>
                        <hr class="dark horizontal my-0">
                        <div class="card-footer p-3">
                            <p class="mb-0"><span class="text-success text-sm font-weight-bolder"></span> Best 3 participants get a scholarship!</p>
                        </div>
                    </div>
                </div>


                <div class="col-xl-4 col-sm-6 mb-xl-0 mb-4">
                    <div class="card">
                        <div class="card-header p-3 pt-2">
                            <div
                                class="icon icon-lg icon-shape bg-gradient-success shadow-success text-center border-radius-xl mt-n4 position-absolute">
                                <i class="material-icons opacity-10">person</i>
                            </div>
                            <div class="text-end pt-1">
                                <p class="text-sm mb-0 text-capitalize">CERTIFICATES</p>
                                <h4 class="mb-0">For all</h4>
                            </div>
                        </div>
                        <hr class="dark horizontal my-0">
                        <div class="card-footer p-3">
                            <p class="mb-0"><span class="text-danger text-sm font-weight-bolder"></span>All participants get a certificate</p>
                            <p class="mb-0"><span class="text-danger text-sm font-weight-bolder"></span>All participants get a certificate</p>
                        </div>
                    </div>
                </div>



                <div class="col-xl-4 col-sm-6">
                    <div class="card">
                        <div class="card-header p-3 pt-2">
                            <div
                                class="icon icon-lg icon-shape bg-gradient-info shadow-info text-center border-radius-xl mt-n4 position-absolute">
                                <i class="material-icons opacity-10">weekend</i>
                            </div>
                            <div class="text-end pt-1">
                                <p class="text-sm mb-0 text-capitalize">PARTICIPANTS</p>
                                <h4 class="mb-0">200+</h4>
                            </div>
                        </div>
                        <hr class="dark horizontal my-0">
                        <div class="card-footer p-3">
                            <p class="mb-0"><span class="text-success text-sm font-weight-bolder"></span>All Registered participants are eligible
                                </p>
                        </div>
                    </div>
                </div>
            </div>

</div>
            <div class="row mt-4 mb-4">
                <div class="col-lg-4 col-md-6 mt-4 mb-4">
                    <div class="card z-index-2 ">
                        <div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2 bg-transparent">
                            <div class="bg-gradient-primary shadow-primary border-radius-lg py-3 pe-1">
                                <div class="chart">
                                    <canvas id="chart-bars" class="chart-canvas" height="170"></canvas>
                                </div>
                            </div>
                        </div>
                        <div class="card-body">
                            <h6 class="mb-0 ">Most Correctly Answered Questions</h6>
                            <p class="text-sm ">Across the week</p>
                            <hr class="dark horizontal">
                            <div class="d-flex ">
                                <i class="material-icons text-sm my-auto me-1">schedule</i>
                                <p class="mb-0 text-sm"> Updated 3 mins ago</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 mt-4 mb-4">
                    <div class="card z-index-2  ">
                        <div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2 bg-transparent">
                            <div class="bg-gradient-success shadow-success border-radius-lg py-3 pe-1">
                                <div class="chart">
                                    <canvas id="chart-line" class="chart-canvas" height="170"></canvas>
                                </div>
                            </div>
                        </div>
                        <div class="card-body">
                            <h6 class="mb-0 "> Performance of Schools and Participants over the years</h6>
                            <p class="text-sm "> <span class="font-weight-bolder"></span> Performance over years
                                </p>
                            <hr class="dark horizontal">
                            <div class="d-flex ">
                                <i class="material-icons text-sm my-auto me-1">schedule</i>
                                <p class="mb-0 text-sm"> Updated 4 min ago </p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 mt-4 mb-3">
                    <div class="card z-index-2 ">
                        <div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2 bg-transparent">
                            <div class="bg-gradient-dark shadow-dark border-radius-lg py-3 pe-1">
                                <div class="chart">
                                    <!-- <canvas id="chart-line-tasks" class="chart-canvas" height="170"></canvas> -->
                                </div>
                            </div>
                        </div>
                        <div class="card-body">
                            <h6 class="mb-0 ">School Rankings</h6>
                            <td>
                            <li>Seeta Junior School</li>
                            <li>Kabojja Junior School</li>
                            <li>City Parents School</li>
                            <li>Kabojja Junior School</li>
                            <li>City Parents School</li>
                            <li>Kabojja Junior School</li>
                            </td>
                            <p class="text-sm ">Qualify for certificate</p>
                            <hr class="dark horizontal">
                            <div class="d-flex ">
                                <i class="material-icons text-sm my-auto me-1">schedule</i>
                                <p class="mb-0 text-sm">Just Updated</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>



<!-- SECOND DIV SECTION -->

<div class="row mt-4s mb-4">
                <div class="col-lg-4 col-md-6 mt-4 mb-4">
                    <div class="card z-index-2 ">
                        <div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2 bg-transparent">
                            <div class="bg-gradient-primary shadow-primary border-radius-lg py-3 pe-1">
                                <div class="chart">
                                    <!-- <canvas id="chart-bars" class="chart-canvas" height="170"></canvas> -->
                                </div>
                            </div>
                        </div>
                        <div class="card-body">
                            <h6 class="mb-0 ">Worst Performing Schools</h6>
                            <ol>
                            <li>Seeta Junior School</li>
                            <li>Kabojja Junior School</li>
                            <li>City Parents School</li>
                            <li>Kabojja Junior School</li>
                            <li>City Parents School</li>
                            </ol>
                            <p class="text-sm ">For a given challenge</p>
                            <hr class="dark horizontal">
                            <div class="d-flex ">
                                <i class="material-icons text-sm my-auto me-1">schedule</i>
                                <p class="mb-0 text-sm"> Updated 3 mins ago</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 mt-4 mb-4">
                    <div class="card z-index-2  ">
                        <div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2 bg-transparent">
                            <div class="bg-gradient-success shadow-success border-radius-lg py-3 pe-1">
                                <div class="chart">
                                    <!-- <canvas id="chart-line" class="chart-canvas" height="170"></canvas> -->
                                </div>
                            </div>
                        </div>
                        <div class="card-body">
                            <h6 class="mb-0 ">Best Performing Schools </h6>
                            <ol>
                            <li>Seeta Junior School</li>
                            <li>Kabojja Junior School</li>
                            <li>City Parents School</li>
                            <li>Kabojja Junior School</li>
                            <li>City Parents School</li>
                            </ol>
                             <p class="text-sm "><span class="font-weight-bolder"></span>Best performing schools for all challenges
                                </p>
                            <hr class="dark horizontal">
                            <div class="d-flex ">
                                <i class="material-icons text-sm my-auto me-1">schedule</i>
                                <p class="mb-0 text-sm"> Updated 4 min ago </p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 mt-4 mb-3">
                    <div class="card z-index-2 ">
                        <div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2 bg-transparent">
                            <div class="bg-gradient-dark shadow-dark border-radius-lg py-3 pe-1">
                                <div class="chart">
                                    <!-- <canvas id="chart-line-tasks" class="chart-canvas" height="170"></canvas> -->
                                </div>
                            </div>
                        </div>
                        <div class="card-body">
                            <h6 class="mb-0 ">Incomplete Challenges</h6>
                            <ol>
                            <li>Seeta Junior School</li>
                            <li>Kabojja Junior School</li>
                            <li>City Parents School</li>
                            <li>Kabojja Junior School</li>
                            <li>City Parents School</li>
                            </ol>
                            <p class="text-sm ">Check for incomplete challenge above</p>
                            <hr class="dark horizontal">
                            <div class="d-flex ">
                                <i class="material-icons text-sm my-auto me-1">schedule</i>
                                <p class="mb-0 text-sm">Just Updated</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


<!-- END OF SECOND DIV -->

        <!-- Projects section -->
            <div class="row mb-4">
                <div class="col-lg-12 col-md-6 mb-md-0 mb-4">
                    <div class="card">
                        <div class="card-header pb-0">
                            <div class="row">
                                <div class="col-lg-6 col-7">
                                    <h6>CHALLENGES DONE PER SCHOOL</h6>
                                    <p class="text-sm mb-0">
                                        <i class="fa fa-check text-info" aria-hidden="true"></i>
                                        <span class="font-weight-bold ms-1">30 done</span> this month
                                    </p>
                                </div>
                                <div class="col-lg-6 col-5 my-auto text-end">
                                    <div class="dropdown float-lg-end pe-4">
                                        <a class="cursor-pointer" id="dropdownTable" data-bs-toggle="dropdown"
                                            aria-expanded="false">
                                            <i class="fa fa-ellipsis-v text-secondary"></i>
                                        </a>
                                        <ul class="dropdown-menu px-2 py-3 ms-sm-n4 ms-n5"
                                            aria-labelledby="dropdownTable">
                                            <li><a class="dropdown-item border-radius-md" href="javascript:;">Action</a>
                                            </li>
                                            <li><a class="dropdown-item border-radius-md" href="javascript:;">Another
                                                    action</a></li>
                                            <li><a class="dropdown-item border-radius-md" href="javascript:;">Something
                                                    else here</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card-body px-0 pb-2">
                            <div class="table-responsive">
                                <table class="table align-items-center mb-0">
                                    <thead>
                                        <tr>
                                            <th
                                                class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">
                                                Schools</th>
                                            <th
                                                class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">
                                                Members</th>
                                            <th
                                                class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">
                                                Challenges Done</th>
                                            <th
                                                class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">
                                                Completion</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>
                                                <div class="d-flex px-2 py-1">
                                                    <div>
                                                        <!-- <img src="{{ asset('assets') }}/img/small-logos/logo-xd.svg" -->
                                                            <class="avatar avatar-sm me-3" alt="xd">
                                                    </div>
                                                    <div class="d-flex flex-column justify-content-center">
                                                        <h6 class="mb-0 text-sm">Seeta Junior School</h6>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="avatar-group mt-2">
                                                    <a href="javascript:;" class="avatar avatar-xs rounded-circle"
                                                        data-bs-toggle="tooltip" data-bs-placement="bottom"
                                                        title="Ryan Tompson">
                                                        <img src="{{ asset('assets') }}/img/team-1.jpg" alt="team1">
                                                    </a>
                                                    <a href="javascript:;" class="avatar avatar-xs rounded-circle"
                                                        data-bs-toggle="tooltip" data-bs-placement="bottom"
                                                        title="Romina Hadid">
                                                        <img src="{{ asset('assets') }}/img/team-2.jpg" alt="team2">
                                                    </a>
                                                    <a href="javascript:;" class="avatar avatar-xs rounded-circle"
                                                        data-bs-toggle="tooltip" data-bs-placement="bottom"
                                                        title="Alexander Smith">
                                                        <img src="{{ asset('assets') }}/img/team-3.jpg" alt="team3">
                                                    </a>
                                                    <a href="javascript:;" class="avatar avatar-xs rounded-circle"
                                                        data-bs-toggle="tooltip" data-bs-placement="bottom"
                                                        title="Jessica Doe">
                                                        <img src="{{ asset('assets') }}/img/team-4.jpg" alt="team4">
                                                    </a>
                                                </div>
                                            </td>
                                            <td class="align-middle text-center text-sm">
                                                <span class="text-xs font-weight-bold"> 3 </span>
                                            </td>
                                            <td class="align-middle">
                                                <div class="progress-wrapper w-75 mx-auto">
                                                    <div class="progress-info">
                                                        <div class="progress-percentage">
                                                            <span class="text-xs font-weight-bold">60%</span>
                                                        </div>
                                                    </div>
                                                    <div class="progress">
                                                        <div class="progress-bar bg-gradient-info w-60"
                                                            role="progressbar" aria-valuenow="60" aria-valuemin="0"
                                                            aria-valuemax="100"></div>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div class="d-flex px-2 py-1">
                                                    <div>
                                                        <!-- <img src="{{ asset('assets') }}/img/small-logos/logo-atlassian.svg" -->
                                                            <class="avatar avatar-sm me-3" alt="atlassian">
                                                    </div>
                                                    <div class="d-flex flex-column justify-content-center">
                                                        <h6 class="mb-0 text-sm">Kabojja Junior Schhol</h6>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="avatar-group mt-2">
                                                    <a href="javascript:;" class="avatar avatar-xs rounded-circle"
                                                        data-bs-toggle="tooltip" data-bs-placement="bottom"
                                                        title="Romina Hadid">
                                                        <img src="{{ asset('assets') }}/img/team-2.jpg" alt="team5">
                                                    </a>
                                                    <a href="javascript:;" class="avatar avatar-xs rounded-circle"
                                                        data-bs-toggle="tooltip" data-bs-placement="bottom"
                                                        title="Jessica Doe">
                                                        <img src="{{ asset('assets') }}/img/team-4.jpg" alt="team6">
                                                    </a>
                                                </div>
                                            </td>
                                            <td class="align-middle text-center text-sm">
                                                <span class="text-xs font-weight-bold"> 5 </span>
                                            </td>
                                            <td class="align-middle">
                                                <div class="progress-wrapper w-75 mx-auto">
                                                    <div class="progress-info">
                                                        <div class="progress-percentage">
                                                            <span class="text-xs font-weight-bold">10%</span>
                                                        </div>
                                                    </div>
                                                    <div class="progress">
                                                        <div class="progress-bar bg-gradient-info w-10"
                                                            role="progressbar" aria-valuenow="10" aria-valuemin="0"
                                                            aria-valuemax="100"></div>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div class="d-flex px-2 py-1">
                                                    <div>
                                                        <!-- <img src="{{ asset('assets') }}/img/small-logos/logo-slack.svg" -->
                                                           <class="avatar avatar-sm me-3" alt="team7">
                                                    </div>
                                                    <div class="d-flex flex-column justify-content-center">
                                                        <h6 class="mb-0 text-sm">City Parents School</h6>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="avatar-group mt-2">
                                                    <a href="javascript:;" class="avatar avatar-xs rounded-circle"
                                                        data-bs-toggle="tooltip" data-bs-placement="bottom"
                                                        title="Romina Hadid">
                                                        <img src="{{ asset('assets') }}/img/team-3.jpg" alt="team8">
                                                    </a>
                                                    <a href="javascript:;" class="avatar avatar-xs rounded-circle"
                                                        data-bs-toggle="tooltip" data-bs-placement="bottom"
                                                        title="Jessica Doe">
                                                        <img src="{{ asset('assets') }}/img/team-1.jpg" alt="team9">
                                                    </a>
                                                </div>
                                            </td>
                                            <td class="align-middle text-center text-sm">
                                                <span class="text-xs font-weight-bold"> 10 </span>
                                            </td>
                                            <td class="align-middle">
                                                <div class="progress-wrapper w-75 mx-auto">
                                                    <div class="progress-info">
                                                        <div class="progress-percentage">
                                                            <span class="text-xs font-weight-bold">100%</span>
                                                        </div>
                                                    </div>
                                                    <div class="progress">
                                                        <div class="progress-bar bg-gradient-success w-100"
                                                            role="progressbar" aria-valuenow="100" aria-valuemin="0"
                                                            aria-valuemax="100"></div>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div class="d-flex px-2 py-1">
                                                    <div>
                                                        <!-- <img src="{{ asset('assets') }}/img/small-logos/logo-spotify.svg" -->
                                                            <class="avatar avatar-sm me-3" alt="spotify">
                                                    </div>
                                                    <div class="d-flex flex-column justify-content-center">
                                                        <h6 class="mb-0 text-sm">Kampala International School Uganda</h6>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="avatar-group mt-2">
                                                    <a href="javascript:;" class="avatar avatar-xs rounded-circle"
                                                        data-bs-toggle="tooltip" data-bs-placement="bottom"
                                                        title="Ryan Tompson">
                                                        <img src="{{ asset('assets') }}/img/team-4.jpg" alt="user1">
                                                    </a>
                                                    <a href="javascript:;" class="avatar avatar-xs rounded-circle"
                                                        data-bs-toggle="tooltip" data-bs-placement="bottom"
                                                        title="Romina Hadid">
                                                        <img src="{{ asset('assets') }}/img/team-3.jpg" alt="user2">
                                                    </a>
                                                    <a href="javascript:;" class="avatar avatar-xs rounded-circle"
                                                        data-bs-toggle="tooltip" data-bs-placement="bottom"
                                                        title="Alexander Smith">
                                                        <img src="{{ asset('assets') }}/img/team-4.jpg" alt="user3">
                                                    </a>
                                                    <a href="javascript:;" class="avatar avatar-xs rounded-circle"
                                                        data-bs-toggle="tooltip" data-bs-placement="bottom"
                                                        title="Jessica Doe">
                                                        <img src="{{ asset('assets') }}/img/team-1.jpg" alt="user4">
                                                    </a>
                                                </div>
                                            </td>
                                            <td class="align-middle text-center text-sm">
                                                <span class="text-xs font-weight-bold"> 7</span>
                                            </td>
                                            <td class="align-middle">
                                                <div class="progress-wrapper w-75 mx-auto">
                                                    <div class="progress-info">
                                                        <div class="progress-percentage">
                                                            <span class="text-xs font-weight-bold">100%</span>
                                                        </div>
                                                    </div>
                                                    <div class="progress">
                                                        <div class="progress-bar bg-gradient-success w-100"
                                                            role="progressbar" aria-valuenow="100" aria-valuemin="0"
                                                            aria-valuemax="100"></div>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div class="d-flex px-2 py-1">
                                                    <div>
                                                        <!-- <img src="{{ asset('assets') }}/img/small-logos/logo-jira.svg" -->
                                                            <class="avatar avatar-sm me-3" alt="jira">
                                                    </div>
                                                    <div class="d-flex flex-column justify-content-center">
                                                        <h6 class="mb-0 text-sm">Rainbow International School</h6>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="avatar-group mt-2">
                                                    <a href="javascript:;" class="avatar avatar-xs rounded-circle"
                                                        data-bs-toggle="tooltip" data-bs-placement="bottom"
                                                        title="Ryan Tompson">
                                                        <img src="{{ asset('assets') }}/img/team-4.jpg" alt="user5">
                                                    </a>
                                                </div>
                                            </td>
                                            <td class="align-middle text-center text-sm">
                                                <span class="text-xs font-weight-bold">4</span>
                                            </td>
                                            <td class="align-middle">
                                                <div class="progress-wrapper w-75 mx-auto">
                                                    <div class="progress-info">
                                                        <div class="progress-percentage">
                                                            <span class="text-xs font-weight-bold">25%</span>
                                                        </div>
                                                    </div>
                                                    <div class="progress">
                                                        <div class="progress-bar bg-gradient-info w-25"
                                                            role="progressbar" aria-valuenow="25" aria-valuemin="0"
                                                            aria-valuemax="25"></div>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div class="d-flex px-2 py-1">
                                                    <div>
                                                        <!-- <img src="{{ asset('assets') }}/img/small-logos/logo-invision.svg" -->
                                                           <class="avatar avatar-sm me-3" alt="invision">
                                                    </div>
                                                    <div class="d-flex flex-column justify-content-center">
                                                        <h6 class="mb-0 text-sm">Galaxy International School</h6>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="avatar-group mt-2">
                                                    <a href="javascript:;" class="avatar avatar-xs rounded-circle"
                                                        data-bs-toggle="tooltip" data-bs-placement="bottom"
                                                        title="Ryan Tompson">
                                                        <img src="{{ asset('assets') }}/img/team-1.jpg" alt="user6">
                                                    </a>
                                                    <a href="javascript:;" class="avatar avatar-xs rounded-circle"
                                                        data-bs-toggle="tooltip" data-bs-placement="bottom"
                                                        title="Jessica Doe">
                                                        <img src="{{ asset('assets') }}/img/team-4.jpg" alt="user7">
                                                    </a>
                                                </div>
                                            </td>
                                            <td class="align-middle text-center text-sm">
                                                <span class="text-xs font-weight-bold"> 5 </span>
                                            </td>
                                            <td class="align-middle">
                                                <div class="progress-wrapper w-75 mx-auto">
                                                    <div class="progress-info">
                                                        <div class="progress-percentage">
                                                            <span class="text-xs font-weight-bold">40%</span>
                                                        </div>
                                                    </div>
                                                    <div class="progress">
                                                        <div class="progress-bar bg-gradient-info w-40"
                                                            role="progressbar" aria-valuenow="40" aria-valuemin="0"
                                                            aria-valuemax="40"></div>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>

    </main>
    <x-plugins></x-plugins>
    </div>


<!-- LOCATION 1 -->


<!-- LOCATION 2 -->
<!-- LOCATION 3 -->
<!-- LOCATION 4 -->
<!-- LOCATION 5 -->
<!-- LOCATION 1 -->


    @push('js')
    <script src="{{ asset('assets') }}/js/plugins/chartjs.min.js"></script>
    <script>
        var ctx = document.getElementById("chart-bars").getContext("2d");

        new Chart(ctx, {
            type: "bar",
            data: {
                labels: ["M", "T", "W", "T", "F", "S", "S"],
                datasets: [{
                    label: "Attempted Challenges",
                    tension: 0.4,
                    borderWidth: 0,
                    borderRadius: 4,
                    borderSkipped: false,
                    backgroundColor: "rgba(255, 255, 255, .8)",
                    data: [50, 20, 10, 22, 50, 10, 40],
                    maxBarThickness: 6
                }, ],
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: {
                        display: false,
                    }
                },
                interaction: {
                    intersect: false,
                    mode: 'index',
                },
                scales: {
                    y: {
                        grid: {
                            drawBorder: false,
                            display: true,
                            drawOnChartArea: true,
                            drawTicks: false,
                            borderDash: [5, 5],
                            color: 'rgba(255, 255, 255, .2)'
                        },
                        ticks: {
                            suggestedMin: 0,
                            suggestedMax: 500,
                            beginAtZero: true,
                            padding: 10,
                            font: {
                                size: 14,
                                weight: 300,
                                family: "Roboto",
                                style: 'normal',
                                lineHeight: 2
                            },
                            color: "#fff"
                        },
                    },
                    x: {
                        grid: {
                            drawBorder: false,
                            display: true,
                            drawOnChartArea: true,
                            drawTicks: false,
                            borderDash: [5, 5],
                            color: 'rgba(255, 255, 255, .2)'
                        },
                        ticks: {
                            display: true,
                            color: '#f8f9fa',
                            padding: 10,
                            font: {
                                size: 14,
                                weight: 300,
                                family: "Roboto",
                                style: 'normal',
                                lineHeight: 2
                            },
                        }
                    },
                },
            },
        });


        var ctx2 = document.getElementById("chart-line").getContext("2d");

        new Chart(ctx2, {
            type: "line",
            data: {
                labels: ["2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017", "2018"],
                datasets: [{
                    label: "Daily Challenges",
                    tension: 0,
                    borderWidth: 0,
                    pointRadius: 5,
                    pointBackgroundColor: "rgba(255, 255, 255, .8)",
                    pointBorderColor: "transparent",
                    borderColor: "rgba(255, 255, 255, .8)",
                    borderColor: "rgba(255, 255, 255, .8)",
                    borderWidth: 4,
                    backgroundColor: "transparent",
                    fill: true,
                    data: [50, 40, 300, 320, 500, 350, 200, 230, 500],
                    maxBarThickness: 6

                }],
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: {
                        display: false,
                    }
                },
                interaction: {
                    intersect: false,
                    mode: 'index',
                },
                scales: {
                    y: {
                        grid: {
                            drawBorder: false,
                            display: true,
                            drawOnChartArea: true,
                            drawTicks: false,
                            borderDash: [5, 5],
                            color: 'rgba(255, 255, 255, .2)'
                        },
                        ticks: {
                            display: true,
                            color: '#f8f9fa',
                            padding: 10,
                            font: {
                                size: 14,
                                weight: 300,
                                family: "Roboto",
                                style: 'normal',
                                lineHeight: 2
                            },
                        }
                    },
                    x: {
                        grid: {
                            drawBorder: false,
                            display: false,
                            drawOnChartArea: false,
                            drawTicks: false,
                            borderDash: [5, 5]
                        },
                        ticks: {
                            display: true,
                            color: '#f8f9fa',
                            padding: 10,
                            font: {
                                size: 14,
                                weight: 300,
                                family: "Roboto",
                                style: 'normal',
                                lineHeight: 2
                            },
                        }
                    },
                },
            },
        });

        var ctx3 = document.getElementById("chart-line-tasks").getContext("2d");

        new Chart(ctx3, {
            type: "line",
            data: {
                labels: ["Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
                datasets: [{
                    label: "Completed Challenges",
                    tension: 0,
                    borderWidth: 0,
                    pointRadius: 5,
                    pointBackgroundColor: "rgba(255, 255, 255, .8)",
                    pointBorderColor: "transparent",
                    borderColor: "rgba(255, 255, 255, .8)",
                    borderWidth: 4,
                    backgroundColor: "transparent",
                    fill: true,
                    data: [50, 40, 300, 220, 500, 250, 400, 230, 500],
                    maxBarThickness: 6

                }],
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: {
                        display: false,
                    }
                },
                interaction: {
                    intersect: false,
                    mode: 'index',
                },
                scales: {
                    y: {
                        grid: {
                            drawBorder: false,
                            display: true,
                            drawOnChartArea: true,
                            drawTicks: false,
                            borderDash: [5, 5],
                            color: 'rgba(255, 255, 255, .2)'
                        },
                        ticks: {
                            display: true,
                            padding: 10,
                            color: '#f8f9fa',
                            font: {
                                size: 14,
                                weight: 300,
                                family: "Roboto",
                                style: 'normal',
                                lineHeight: 2
                            },
                        }
                    },
                    x: {
                        grid: {
                            drawBorder: false,
                            display: false,
                            drawOnChartArea: false,
                            drawTicks: false,
                            borderDash: [5, 5]
                        },
                        ticks: {
                            display: true,
                            color: '#f8f9fa',
                            padding: 10,
                            font: {
                                size: 14,
                                weight: 300,
                                family: "Roboto",
                                style: 'normal',
                                lineHeight: 2
                            },
                        }
                    },
                },
            },
        });

    </script>
    @endpush
</x-layout>






<!-- LOCATION -->
<!-- ####### -->
<!--  -->