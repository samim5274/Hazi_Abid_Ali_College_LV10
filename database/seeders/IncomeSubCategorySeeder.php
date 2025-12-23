<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\IncomeSubCategory;
use App\Models\IncomeCategory;

class IncomeSubCategorySeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $subcategories = [
            'Tuition Fee' => ['Grade 1-5', 'Grade 6-10', 'Grade 11-12'],
            'Donation' => ['Alumni Donation', 'Sponsor Donation'],
            'Library Fee' => ['Book Fee', 'Late Fee'],
            'Transport Fee' => ['Bus Fee', 'Van Fee'],
            'Examination Fee' => ['Monthly Test', 'Final Exam'],
        ];

        foreach($subcategories as $categoryName => $subs){
            $category = IncomeCategory::where('name', $categoryName)->first();
            if($category){
                foreach($subs as $sub){
                    IncomeSubCategory::create([
                        'category_id' => $category->id,
                        'name' => $sub,
                        'description' => 'Subcategory of '.$categoryName
                    ]);
                }
            }
        }
    }
}
