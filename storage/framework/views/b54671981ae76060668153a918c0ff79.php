<!-- Footer-->
<footer class="content-footer footer bg-footer-theme">
  <div class="<?php echo e((!empty($containerNav) ? $containerNav : 'container-fluid')); ?>">
    <div class="footer-container d-flex align-items-center justify-content-between py-3 flex-md-row flex-column">
      <div class="text-body mb-2 mb-md-0">
        © <script>
          document.write(new Date().getFullYear())
        </script>, made with <span class="text-danger"><i class="tf-icons mdi mdi-heart"></i></span> by <a href="<?php echo e((!empty(config('variables.creatorUrl')) ? config('variables.creatorUrl') : '')); ?>" target="_blank" class="footer-link fw-medium"><?php echo e((!empty(config('variables.creatorName')) ? config('variables.creatorName') : '')); ?></a>
      </div>
      <div  class="d-none d-lg-inline-block">
        <a href="<?php echo e(config('variables.licenseUrl') ? config('variables.licenseUrl') : '#'); ?>" class="footer-link me-3" target="_blank">License</a>
        <a href="<?php echo e(config('variables.moreThemes') ? config('variables.moreThemes') : '#'); ?>" target="_blank" class="footer-link me-3">More Themes</a>
        <a href="<?php echo e(config('variables.documentation') ? config('variables.documentation').'/laravel-introduction.html' : '#'); ?>" target="_blank" class="footer-link me-3">Documentation</a>
        <a href="<?php echo e(config('variables.support') ? config('variables.support') : '#'); ?>" target="_blank" class="footer-link d-none d-sm-inline-block">Support</a>
      </div>
    </div>
  </div>
</footer>
<!--/ Footer-->
<?php /**PATH C:\xampp\htdocs\materio\html-laravel-free-internal\full-version\resources\views/layouts/sections/footer/footer.blade.php ENDPATH**/ ?>