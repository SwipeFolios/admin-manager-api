<?php

// autoload_static.php @generated by Composer

namespace Composer\Autoload;

class ComposerStaticInited25c4f2983ceb2bd92b9634b3ce84e4
{
    public static $prefixLengthsPsr4 = array (
        'P' => 
        array (
            'Psr\\Log\\' => 8,
        ),
        'M' => 
        array (
            'Monolog\\' => 8,
        ),
    );

    public static $prefixDirsPsr4 = array (
        'Psr\\Log\\' => 
        array (
            0 => __DIR__ . '/..' . '/psr/log/Psr/Log',
        ),
        'Monolog\\' => 
        array (
            0 => __DIR__ . '/..' . '/monolog/monolog/src/Monolog',
        ),
    );

    public static $prefixesPsr0 = array (
        'B' => 
        array (
            'Bramus' => 
            array (
                0 => __DIR__ . '/..' . '/bramus/router/src',
            ),
        ),
    );

    public static $classMap = array (
        'Composer\\InstalledVersions' => __DIR__ . '/..' . '/composer/InstalledVersions.php',
    );

    public static function getInitializer(ClassLoader $loader)
    {
        return \Closure::bind(function () use ($loader) {
            $loader->prefixLengthsPsr4 = ComposerStaticInited25c4f2983ceb2bd92b9634b3ce84e4::$prefixLengthsPsr4;
            $loader->prefixDirsPsr4 = ComposerStaticInited25c4f2983ceb2bd92b9634b3ce84e4::$prefixDirsPsr4;
            $loader->prefixesPsr0 = ComposerStaticInited25c4f2983ceb2bd92b9634b3ce84e4::$prefixesPsr0;
            $loader->classMap = ComposerStaticInited25c4f2983ceb2bd92b9634b3ce84e4::$classMap;

        }, null, ClassLoader::class);
    }
}
