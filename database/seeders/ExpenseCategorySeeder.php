<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

use App\Models\Excategory;

class ExpenseCategorySeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $categories = [
            ['name' => 'Salary'],
            ['name' => 'Utility'],
            ['name' => 'Maintenance'],
            ['name' => 'Academic'],
            ['name' => 'Transport'],
            ['name' => 'Event'],
        ];

        foreach ($categories as $category) {
            Excategory::create($category);
        }
    }
}
