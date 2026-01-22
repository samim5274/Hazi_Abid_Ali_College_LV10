<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Exam;
use Carbon\Carbon;

class ExamSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $exams = [
            [
                'name'        => 'Class Test',
                'date'        => Carbon::now(),
                'class_id'    => 1,
                'subject_id'  => 1,
                'max_marks'   => 20,
            ],
            [
                'name'        => 'Month Test',
                'date'        => Carbon::now(),
                'class_id'    => 1,
                'subject_id'  => 1,
                'max_marks'   => 30,
            ],
            [
                'name'        => 'Midterm',
                'date'        => Carbon::now(),
                'class_id'    => 1,
                'subject_id'  => 1,
                'max_marks'   => 50,
            ],
            [
                'name'        => 'Final',
                'date'        => Carbon::now(),
                'class_id'    => 1,
                'subject_id'  => 1,
                'max_marks'   => 100,
            ],
        ];

        foreach ($exams as $exam) {
            Exam::firstOrCreate(
                [
                    'name'       => $exam['name'],
                    'class_id'   => $exam['class_id'],
                    'subject_id' => $exam['subject_id'],
                ],
                $exam
            );
        }
    }
}
