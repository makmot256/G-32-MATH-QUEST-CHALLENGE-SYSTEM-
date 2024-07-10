<x-layout bodyClass="g-sidenav-show bg-gray-200">
    <x-navbars.sidebar activePage="notifications"></x-navbars.sidebar>
    <main class="main-content position-relative max-height-vh-100 h-100 border-radius-lg">
        <!-- Navbar -->
        <x-navbars.navs.auth titlePage="Notifications"></x-navbars.navs.auth>
        <!-- End Navbar -->
        <div class="container-fluid py-4">
            <div class="row">
                <div class="col-lg-8 col-md-10 mx-auto">
                    <div class="card mt-4">
                        <div class="card-header p-3">
                            <h5 class="mb-0">Notifications</h5>
                            <p class="text-sm mb-0">
                                <a
                                    href="https://getbootstrap.com/docs/5.0/components/toasts/" target="_blank"></a>.
                            </p>
                        </div>
                        <div class="card-body p-3">
                            <!-- Dynamic Toasts -->
                            <div id="toast-container" class="toast-container position-fixed bottom-1 end-1 z-index-2">
                                <!-- Success Toast (Example) -->
                                <div class="toast fade hide p-2 bg-white" role="alert" aria-live="assertive"
                                    id="successToast" aria-atomic="true">
                                    <div class="toast-header border-0">
                                        <i class="material-icons text-success me-2">check</i>
                                        <span class="me-auto font-weight-bold">System Notification</span>
                                        <small class="text-body">Just now</small>
                                        <button type="button" class="btn-close" data-bs-dismiss="toast"
                                            aria-label="Close"></button>
                                    </div>
                                    <hr class="horizontal dark m-0">
                                    <div class="toast-body">
                                        A new participant has registered successfully.
                                    </div>
                                </div>
                                
                                <!-- Challenge Activation Reminder Toast -->
                                <div class="toast fade hide p-2 mt-2 bg-gradient-info" role="alert"
                                    aria-live="assertive" id="challengeReminderToast" aria-atomic="true">
                                    <div class="toast-header bg-transparent border-0">
                                        <i class="material-icons text-white me-2">notifications</i>
                                        <span class="me-auto text-white font-weight-bold">System Notification</span>
                                        <small class="text-white">5 minutes ago</small>
                                        <button type="button" class="btn-close" data-bs-dismiss="toast"
                                            aria-label="Close"></button>
                                    </div>
                                    <hr class="horizontal light m-0">
                                    <div class="toast-body text-white">
                                        Reminder: Please confirm the registration of a new participant.
                                    </div>
                                </div>

                                <!-- Challenge Open Notification Toast -->
                                <div class="toast fade hide p-2 mt-2 bg-white" role="alert"
                                    aria-live="assertive" id="challengeOpenToast" aria-atomic="true">
                                    <div class="toast-header border-0">
                                        <i class="material-icons text-info me-2">event_note</i>
                                        <span class="me-auto font-weight-bold">System Notification</span>
                                        <small class="text-body">Just now</small>
                                        <button type="button" class="btn-close" data-bs-dismiss="toast"
                                            aria-label="Close"></button>
                                    </div>
                                    <hr class="horizontal dark m-0">
                                    <div class="toast-body">
                                        Challenge ABC is now open for participation.
                                    </div>
                                </div>

                                <!-- Score and Report Notification Toast -->
                                <div class="toast fade hide p-2 mt-2 bg-white" role="alert"
                                    aria-live="assertive" id="scoreReportToast" aria-atomic="true">
                                    <div class="toast-header border-0">
                                        <i class="material-icons text-success me-2">assessment</i>
                                        <span class="me-auto font-weight-bold">System Notification</span>
                                        <small class="text-body">Just now</small>
                                        <button type="button" class="btn-close" data-bs-dismiss="toast"
                                            aria-label="Close"></button>
                                    </div>
                                    <hr class="horizontal dark m-0">
                                    <div class="toast-body">
                                        Your score report is ready for download.
                                    </div>
                                </div>

                                <!-- Rejection Notification Toast -->
                                <div class="toast fade hide p-2 mt-2 bg-white" role="alert"
                                    aria-live="assertive" id="rejectionToast" aria-atomic="true">
                                    <div class="toast-header border-0">
                                        <i class="material-icons text-danger me-2">highlight_off</i>
                                        <span class="me-auto font-weight-bold">System Notification</span>
                                        <small class="text-body">Just now</small>
                                        <button type="button" class="btn-close" data-bs-dismiss="toast"
                                            aria-label="Close"></button>
                                    </div>
                                    <hr class="horizontal dark m-0">
                                    <div class="toast-body">
                                        Your registration has been rejected.
                                    </div>
                                </div>

                                <!-- Error Notification Toast -->
                                <div class="toast fade hide p-2 mt-2 bg-white" role="alert"
                                    aria-live="assertive" id="errorToast" aria-atomic="true">
                                    <div class="toast-header border-0">
                                        <i class="material-icons text-danger me-2">error</i>
                                        <span class="me-auto font-weight-bold">System Notification</span>
                                        <small class="text-body">Just now</small>
                                        <button type="button" class="btn-close" data-bs-dismiss="toast"
                                            aria-label="Close"></button>
                                    </div>
                                    <hr class="horizontal dark m-0">
                                    <div class="toast-body">
                                        An error occurred. Please try again later.
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
           
        </div>
    </main>
    <x-plugins></x-plugins>

    <!-- Include JavaScript for Toast functionality -->
    <script>
        // Example of showing a toast (replace with actual dynamic triggers)
        document.addEventListener('DOMContentLoaded', function () {
            var successToastEl = document.getElementById('successToast');
            var challengeReminderToastEl = document.getElementById('challengeReminderToast');
            var challengeOpenToastEl = document.getElementById('challengeOpenToast');
            var scoreReportToastEl = document.getElementById('scoreReportToast');
            var rejectionToastEl = document.getElementById('rejectionToast');
            var errorToastEl = document.getElementById('errorToast');

            // Example trigger for showing success toast (replace with actual logic)
            setTimeout(function () {
                var successToast = new bootstrap.Toast(successToastEl);
                successToast.show();
            }, 2000); // Show after 2 seconds

            // Example trigger for showing challenge activation reminder toast (replace with actual logic)
            setTimeout(function () {
                var challengeReminderToast = new bootstrap.Toast(challengeReminderToastEl);
                challengeReminderToast.show();
            }, 5000); // Show after 5 seconds

            // Example trigger for showing challenge open notification toast (replace with actual logic)
            setTimeout(function () {
                var challengeOpenToast = new bootstrap.Toast(challengeOpenToastEl);
                challengeOpenToast.show();
            }, 8000); // Show after 8 seconds

            // Example trigger for showing score report toast (replace with actual logic)
            setTimeout(function () {
                var scoreReportToast = new bootstrap.Toast(scoreReportToastEl);
                scoreReportToast.show();
            }, 11000); // Show after 11 seconds

            // Example trigger for showing rejection toast (replace with actual logic)
            setTimeout(function () {
                var rejectionToast = new bootstrap.Toast(rejectionToastEl);
                rejectionToast.show();
            }, 14000); // Show after 14 seconds

            // Example trigger for showing error toast (replace with actual logic)
            setTimeout(function () {
                var errorToast = new bootstrap.Toast(errorToastEl);
                errorToast.show();
            }, 17000); // Show after 17 seconds
        });
    </script>

<style>
        .toast-container {
            position: fixed;
            bottom: 0;
            right: 0;
            left: 0;
            margin: auto;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            max-width: 90%; /* Adjust max-width as needed */
        }
    </style>

</x-layout>
