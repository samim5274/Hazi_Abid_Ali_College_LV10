<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class GroupSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $groups = [
            // HSC / College Level
            ['name' => 'Science (General Science)'],
            ['name' => 'Science (Biology / Pre-Medical)'],
            ['name' => 'Science (Physical Science / Pre-Engineering)'],
            ['name' => 'Science (Computer Science / ICT Focus)'],

            ['name' => 'Arts (Humanities / General Arts)'],
            ['name' => 'Arts (Social Science)'],
            ['name' => 'Arts (Fine Arts / Performing Arts)'],
            ['name' => 'Arts (Language & Literature Focus)'],

            ['name' => 'Commerce (Business Studies)'],
            ['name' => 'Commerce (Accounting / Finance Focus)'],
            ['name' => 'Commerce (Management / Marketing Focus)'],
            ['name' => 'Commerce (Economics Focus)'],
        ];

        DB::table('groups')->insert($groups);
    }
}
