<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class FeeCategroySeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $categories = [
            ['name' => 'Tuition Fee', 'description' => 'Regular fee for academic instruction and classes'],
            ['name' => 'Admission Fee', 'description' => 'One-time fee for student enrollment'],
            ['name' => 'Exam Fee', 'description' => 'Fee for conducting examinations'],
            ['name' => 'Library Fee', 'description' => 'Charge for library access and maintenance'],
            ['name' => 'Laboratory Fee', 'description' => 'Fee for science/computer lab usage'],
            ['name' => 'Sports Fee', 'description' => 'Charge for sports activities and events'],
            ['name' => 'Transport Fee', 'description' => 'Fee for school bus/transport facilities'],
            ['name' => 'Hostel Fee', 'description' => 'Accommodation and meal charges in hostel'],
            ['name' => 'Development Fee', 'description' => 'Fee for infrastructure and school development'],
            ['name' => 'Activity Fee', 'description' => 'Fee for extracurricular activities and events'],
        ];

        foreach ($categories as $category) {
            DB::table('fee_categories')->insert([
                'name'        => $category['name'],
                'description' => $category['description'],
                'created_at'  => now(),
                'updated_at'  => now(),
            ]);
        }
    }
}
