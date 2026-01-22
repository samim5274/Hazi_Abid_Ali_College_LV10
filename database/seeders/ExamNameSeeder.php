<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\ExamName;

class ExamNameSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $examNames = [
            'Class Test',
            'Month Test',
            'Midterm',
            'Final',
        ];

        foreach ($examNames as $name) {
            ExamName::firstOrCreate([
                'exam_name' => $name
            ]);
        }
    }
}
