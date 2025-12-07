<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

use App\Models\Exsubcategory;
use App\Models\Excategory;

class ExpenseSubcategorySeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $salary = Excategory::where('name', 'Salary')->first();
        $utility = Excategory::where('name', 'Utility')->first();
        $maintenance = Excategory::where('name', 'Maintenance')->first();
        $academic = Excategory::where('name', 'Academic')->first();
        $transport = Excategory::where('name', 'Transport')->first();
        $event = Excategory::where('name', 'Event')->first();

        $subcategories = [
            // Salary
            ['cat_id' => $salary->id, 'name' => 'Teacher Salary'],
            ['cat_id' => $salary->id, 'name' => 'Staff Salary'],
            ['cat_id' => $salary->id, 'name' => 'Guest Teacher Salary'],

            // Utility
            ['cat_id' => $utility->id, 'name' => 'Electricity Bill'],
            ['cat_id' => $utility->id, 'name' => 'Water Bill'],
            ['cat_id' => $utility->id, 'name' => 'Internet Bill'],

            // Maintenance
            ['cat_id' => $maintenance->id, 'name' => 'Furniture Repair'],
            ['cat_id' => $maintenance->id, 'name' => 'Building Repair'],
            ['cat_id' => $maintenance->id, 'name' => 'Painting'],

            // Academic
            ['cat_id' => $academic->id, 'name' => 'Books Purchase'],
            ['cat_id' => $academic->id, 'name' => 'Lab Equipment'],
            ['cat_id' => $academic->id, 'name' => 'Classroom Materials'],

            // Transport
            ['cat_id' => $transport->id, 'name' => 'Bus Fuel'],
            ['cat_id' => $transport->id, 'name' => 'Driver Salary'],
            ['cat_id' => $transport->id, 'name' => 'Vehicle Repair'],

            // Event
            ['cat_id' => $event->id, 'name' => 'Annual Program'],
            ['cat_id' => $event->id, 'name' => 'Sports Day'],
            ['cat_id' => $event->id, 'name' => 'Prize Giving Ceremony'],
        ];

        foreach ($subcategories as $subcat) {
            Exsubcategory::create($subcat);
        }
    }
}
