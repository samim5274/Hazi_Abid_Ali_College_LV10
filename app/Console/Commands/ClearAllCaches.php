<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\Artisan;

class ClearAllCaches extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'clear:all';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Clear config, cache, route and view caches at once';

    /**
     * Execute the console command.
     */
    public function handle()
    {
        $this->info('Clearing all caches...');

        Artisan::call('config:clear');
        $this->info('✔ Config cache cleared');

        Artisan::call('cache:clear');
        $this->info('✔ Application cache cleared');

        Artisan::call('view:clear');
        $this->info('✔ View cache cleared');

        Artisan::call('route:clear');
        $this->info('✔ Route cache cleared');

        $this->info('🎉 All caches cleared successfully!');
    }
}
