<?php $__env->startSection('title', 'Error - Pages'); ?>

<?php $__env->startSection('page-style'); ?>
<!-- Page -->
<link rel="stylesheet" href="<?php echo e(asset('assets/vendor/css/pages/page-misc.css')); ?>">
<?php $__env->stopSection(); ?>


<?php $__env->startSection('content'); ?>
<!-- Error -->
<div class="misc-wrapper">
  <h1 class="mb-2 mx-2" style="font-size: 6rem;">404</h1>
  <h4 class="mb-2">Page Not Found ⚠️</h4>
  <p class="mb-4 mx-2">we couldn't find the page you are looking for</p>
  <div class="d-flex justify-content-center mt-5">
    <img src="<?php echo e(asset('assets/img/illustrations/tree.png')); ?>" alt="misc-tree" class="img-fluid misc-object d-none d-lg-inline-block" width="80">
    <img src="<?php echo e(asset('assets/img/illustrations/misc-mask-light.png')); ?>" alt="misc-error" class="scaleX-n1-rtl misc-bg d-none d-lg-inline-block">
    <div class="d-flex flex-column align-items-center">
      <img src="<?php echo e(asset('assets/img/illustrations/404.png')); ?>" alt="misc-error" class="misc-model img-fluid z-1" width="780">
      <div>
        <a href="<?php echo e(url('/')); ?>" class="btn btn-primary text-center my-4">Back to home</a>
      </div>
    </div>
  </div>
</div>
<!-- /Error -->
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts/blankLayout', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\xampp\htdocs\materio\html-laravel-free-internal\full-version\resources\views/content/pages/pages-misc-error.blade.php ENDPATH**/ ?>