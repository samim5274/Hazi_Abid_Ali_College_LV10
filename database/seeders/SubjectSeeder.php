<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

use App\Models\Subject;
use App\Models\Exam;

class SubjectSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $subjects = [
            // Class 11-12 (Science, Commerce, Arts)
            1 => [
                // Compulsory
                'Bangla', 'English', 'ICT', 'Physical Education',
                // Science Group
                'Physics', 'Chemistry', 'Biology', 'Higher Mathematics',
                // Commerce Group
                'Accounting', 'Business Organization & Management', 'Finance, Banking & Insurance', 'Production Management & Marketing',
                // Arts Group
                'Logic', 'History', 'Civics', 'Economics', 'Islamic Studies', 'Sociology', 'Social Work', 'Geography'
            ],
            2 => [
                // Compulsory
                'Bangla', 'English', 'ICT', 'Physical Education',
                // Science Group
                'Physics', 'Chemistry', 'Biology', 'Higher Mathematics',
                // Commerce Group
                'Accounting', 'Business Organization & Management', 'Finance, Banking & Insurance', 'Production Management & Marketing',
                // Arts Group
                'Logic', 'History', 'Civics', 'Economics', 'Islamic Studies', 'Sociology', 'Social Work', 'Geography'
            ],

            // Degree level subjects
            3 => [
                'Bangla', 'English', 'ICT', 'Physical Education',
                'Physics', 'Chemistry', 'Biology', 'Higher Mathematics',
                'Accounting', 'Business Organization & Management', 'Finance, Banking & Insurance', 'Production Management & Marketing',
                'Logic', 'History', 'Civics', 'Economics', 'Islamic Studies', 'Sociology', 'Social Work', 'Geography',
            ],

            4 => [
                'Bangla', 'English', 'ICT', 'Physical Education',
                'Physics', 'Chemistry', 'Biology', 'Higher Mathematics',
                'Accounting', 'Business Organization & Management', 'Finance, Banking & Insurance', 'Production Management & Marketing',
                'Logic', 'History', 'Civics', 'Economics', 'Islamic Studies', 'Sociology', 'Social Work', 'Geography',
            ],

            5 => [
                'Bangla', 'English', 'ICT', 'Physical Education',
                'Physics', 'Chemistry', 'Biology', 'Higher Mathematics',
                'Accounting', 'Business Organization & Management', 'Finance, Banking & Insurance', 'Production Management & Marketing',
                'Logic', 'History', 'Civics', 'Economics', 'Islamic Studies', 'Sociology', 'Social Work', 'Geography',
            ],
        ];

        foreach ($subjects as $class => $subs) {
            foreach ($subs as $subject) {
                DB::table('subjects')->insert([
                    'class_id' => $class,
                    'name' => $subject,
                    'created_at' => now(),
                    'updated_at' => now(),
                ]);
            }
        }
    }
}
