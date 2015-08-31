<?php

$dir = __DIR__ . '/../_vendor/magephp/magallanes/Mage';

$iterator = Symfony\Component\Finder\Finder::create()
    ->files()
    ->name('*.php')
    ->exclude('build')
    ->exclude('tests')
    ->in($dir);

$options = [
    'theme'                => 'default',
    'title'                => 'Magallanes API Documentation',
    'build_dir'            => __DIR__ . '/../api',
    'cache_dir'            => __DIR__ . '/../.api-cache/sami',
];

$sami = new Sami\Sami($iterator, $options);

return $sami;
