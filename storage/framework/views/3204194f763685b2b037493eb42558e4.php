<?php $__env->startSection('title', 'Under Maintenance - Pages'); ?>

<?php $__env->startSection('page-style'); ?>
<!-- Page -->
<link rel="stylesheet" href="<?php echo e(asset('assets/vendor/css/pages/page-misc.css')); ?>">
<?php $__env->stopSection(); ?>

<?php $__env->startSection('content'); ?>
<!--Under Maintenance -->
<div class="misc-wrapper">
  <h3 class="mb-2 mx-2">Under Maintenance! 🚧</h3>
  <p class="mb-4 mx-2">Sorry for the inconvenience but we're performing some maintenance at the moment</p>
  <div class="d-flex justify-content-center mt-5">
    <img src="<?php echo e(asset('assets/img/illustrations/tree-3.png')); ?>" alt="misc-tree" class="img-fluid misc-object d-none d-lg-inline-block" width="150">
    <img src="<?php echo e(asset('assets/img/illustrations/misc-mask-light.png')); ?>" alt="misc-error" class="scaleX-n1-rtl misc-bg d-none d-lg-inline-block">
    <div class="d-flex flex-column align-items-center">
      <img src="<?php echo e(asset('assets/img/illustrations/misc-under-maintenance.png')); ?>" alt="misc-error" class="img-fluid z-1" width="780">
      <div>
        <a href="<?php echo e(url('/')); ?>" class="btn btn-primary text-center my-5">Back to home</a>
      </div>
    </div>
  </div>
</div>
<!-- /Under Maintenance -->
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts/blankLayout', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\xampp\htdocs\materio\html-laravel-free-internal\full-version\resources\views/content/pages/pages-misc-under-maintenance.blade.php ENDPATH**/ ?>