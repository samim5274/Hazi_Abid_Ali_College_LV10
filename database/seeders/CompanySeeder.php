<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;
use App\Models\Company;

class CompanySeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('companies')->insert([
            'name'       => 'Hazi Abed Ali College',
            'address'    => 'East Brahmondi, Narsingdi. || Code - 3010 || Degree - 5424 || EIIN - 112717',
            'email'      => 'info@haac.edu.bd',
            'phone'      => '01700000000',
            'website'    => 'www.haac.edu.bd',
            'created_at' => Carbon::now(),
            'updated_at' => Carbon::now(),
        ]);
    }
}
