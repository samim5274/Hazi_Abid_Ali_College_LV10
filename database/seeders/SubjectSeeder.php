<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

use App\Models\Subject;
use App\Models\Exam;
use App\Models\Group;

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
                1 => ['Bangla', 'English', 'ICT', 'Physical Education'], // Compulsory
                2 => ['Physics', 'Chemistry', 'Biology', 'Higher Mathematics'], // Science
                3 => ['Accounting', 'Business Organization & Management', 'Finance, Banking & Insurance', 'Production Management & Marketing'], // Commerce
                4 => ['Logic', 'History', 'Civics', 'Economics', 'Islamic Studies', 'Sociology', 'Social Work', 'Geography'], // Arts
            ],
            2 => [
                1 => ['Bangla', 'English', 'ICT', 'Physical Education'],
                2 => ['Physics', 'Chemistry', 'Biology', 'Higher Mathematics'],
                3 => ['Accounting', 'Business Organization & Management', 'Finance, Banking & Insurance', 'Production Management & Marketing'],
                4 => ['Logic', 'History', 'Civics', 'Economics', 'Islamic Studies', 'Sociology', 'Social Work', 'Geography'],
            ],

            // Degree level subjects
            3 => [
                1 => ['Bangla', 'English', 'ICT', 'Physical Education'],
                2 => ['Physics', 'Chemistry', 'Biology', 'Higher Mathematics'],
                3 => ['Accounting', 'Business Organization & Management', 'Finance, Banking & Insurance', 'Production Management & Marketing'],
                4 => ['Logic', 'History', 'Civics', 'Economics', 'Islamic Studies', 'Sociology', 'Social Work', 'Geography'],
            ],

            4 => [
                1 => ['Bangla', 'English', 'ICT', 'Physical Education'],
                2 => ['Physics', 'Chemistry', 'Biology', 'Higher Mathematics'],
                3 => ['Accounting', 'Business Organization & Management', 'Finance, Banking & Insurance', 'Production Management & Marketing'],
                4 => ['Logic', 'History', 'Civics', 'Economics', 'Islamic Studies', 'Sociology', 'Social Work', 'Geography'],
            ],

            5 => [
                1 => ['Bangla', 'English', 'ICT', 'Physical Education'],
                2 => ['Physics', 'Chemistry', 'Biology', 'Higher Mathematics'],
                3 => ['Accounting', 'Business Organization & Management', 'Finance, Banking & Insurance', 'Production Management & Marketing'],
                4 => ['Logic', 'History', 'Civics', 'Economics', 'Islamic Studies', 'Sociology', 'Social Work', 'Geography'],
            ],
        ];

        foreach ($subjects as $classId => $groups) {
            foreach ($groups as $groupId => $subs) {
                foreach ($subs as $subject) {
                    DB::table('subjects')->insert([
                        'class_id' => $classId,
                        'group_id' => $groupId,  // Added group_id
                        'name' => $subject,
                        'created_at' => now(),
                        'updated_at' => now(),
                    ]);
                }
            }
        }
    }
}
