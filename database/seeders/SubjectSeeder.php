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
            1 => ['Bangla', 'English', 'Mathematics', 'General Knowledge', 'Religion'],
            2 => ['Bangla', 'English', 'Mathematics', 'General Knowledge', 'Religion'],
            3 => ['Bangla', 'English', 'Mathematics', 'Elementary Science', 'General Knowledge', 'Religion'],
            4 => ['Bangla', 'English', 'Mathematics', 'Elementary Science', 'General Knowledge', 'Religion'],
            5 => ['Bangla', 'English', 'Mathematics', 'Bangladesh and Global Studies', 'Science', 'Religion', 'Arts and Crafts', 'Physical Education'],
            6 => ['Bangla', 'English', 'Mathematics', 'Science', 'Bangladesh and Global Studies', 'Religion', 'Arts and Crafts', 'Physical Education'],
            7 => ['Bangla', 'English', 'Mathematics', 'Science', 'Bangladesh and Global Studies', 'Religion', 'Arts and Crafts', 'Physical Education'],
            8 => ['Bangla', 'English', 'Mathematics', 'Science', 'Bangladesh and Global Studies', 'Religion', 'Arts and Crafts', 'Physical Education', 'ICT'],
            
            // Class 9-10 (Science, Commerce, Arts)
            9 => [
                // Compulsory
                'Bangla', 'English', 'Mathematics', 'Bangladesh and Global Studies', 'Religion', 'ICT', 'Physical Education',
                // Science Group
                'Physics', 'Chemistry', 'Biology', 'Higher Mathematics',
                // Commerce Group
                'Accounting', 'Business Entrepreneurship', 'Finance & Banking',
                // Arts Group
                'History of Bangladesh & World Civilization', 'Civics & Citizenship', 'Geography & Environment', 'Economics'
            ],
            10 => [
                // Compulsory
                'Bangla', 'English', 'Mathematics', 'Bangladesh and Global Studies', 'Religion', 'ICT', 'Physical Education',
                // Science Group
                'Physics', 'Chemistry', 'Biology', 'Higher Mathematics',
                // Commerce Group
                'Accounting', 'Business Entrepreneurship', 'Finance & Banking',
                // Arts Group
                'History of Bangladesh & World Civilization', 'Civics & Citizenship', 'Geography & Environment', 'Economics'
            ],

            // Class 11-12 (Science, Commerce, Arts)
            11 => [
                // Compulsory
                'Bangla', 'English', 'ICT', 'Physical Education',
                // Science Group
                'Physics', 'Chemistry', 'Biology', 'Higher Mathematics',
                // Commerce Group
                'Accounting', 'Business Organization & Management', 'Finance, Banking & Insurance', 'Production Management & Marketing',
                // Arts Group
                'Logic', 'History', 'Civics', 'Economics', 'Islamic Studies', 'Sociology', 'Social Work', 'Geography'
            ],
            12 => [
                // Compulsory
                'Bangla', 'English', 'ICT', 'Physical Education',
                // Science Group
                'Physics', 'Chemistry', 'Biology', 'Higher Mathematics',
                // Commerce Group
                'Accounting', 'Business Organization & Management', 'Finance, Banking & Insurance', 'Production Management & Marketing',
                // Arts Group
                'Logic', 'History', 'Civics', 'Economics', 'Islamic Studies', 'Sociology', 'Social Work', 'Geography'
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
