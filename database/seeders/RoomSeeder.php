<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class RoomSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $rooms = [
            ['name' => 'Class 1',  'section' => 'A', 'class_teacher_id' => '1',   'capacity' => 40],
            ['name' => 'Class 2',  'section' => 'A', 'class_teacher_id' => '2',    'capacity' => 42],
            ['name' => 'Class 3',  'section' => 'A', 'class_teacher_id' => '3', 'capacity' => 44],
            ['name' => 'Class 4',  'section' => 'A', 'class_teacher_id' => '4',  'capacity' => 46],
            ['name' => 'Class 5',  'section' => 'A', 'class_teacher_id' => '5',     'capacity' => 48],
            ['name' => 'Class 6',  'section' => 'A', 'class_teacher_id' => '6',   'capacity' => 50],
            ['name' => 'Class 7',  'section' => 'A', 'class_teacher_id' => '7',    'capacity' => 52],
            ['name' => 'Class 8',  'section' => 'A', 'class_teacher_id' => '8',     'capacity' => 54],
            ['name' => 'Class 9',  'section' => 'A', 'class_teacher_id' => '9',   'capacity' => 56],
            ['name' => 'Class 10', 'section' => 'A', 'class_teacher_id' => '10',    'capacity' => 58],
            ['name' => 'Class 11', 'section' => 'A', 'class_teacher_id' => '11',  'capacity' => 60],
            ['name' => 'Class 12', 'section' => 'A', 'class_teacher_id' => '12',    'capacity' => 62],
        ];


        DB::table('rooms')->insert($rooms);
    }
}
