<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\IncomeCategory;

class IncomeCategorySeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $categories = [
            ['name' => 'Tuition Fee', 'description' => 'Income from tuition'],
            ['name' => 'Donation', 'description' => 'Income from donations'],
            ['name' => 'Library Fee', 'description' => 'Income from library'],
            ['name' => 'Transport Fee', 'description' => 'Income from transport'],
            ['name' => 'Examination Fee', 'description' => 'Income from exams'],
        ];

        foreach($categories as $cat){
            IncomeCategory::create($cat);
        }
    }
}
