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
            ['name' => 'Class 11', 'section' => 'A', 'class_teacher_id' => '11',  'capacity' => 60],
            ['name' => 'Class 12', 'section' => 'A', 'class_teacher_id' => '12',    'capacity' => 62],
            ['name' => 'Class 13', 'section' => 'A', 'class_teacher_id' => '12',    'capacity' => 62],
            ['name' => 'Class 14', 'section' => 'A', 'class_teacher_id' => '12',    'capacity' => 62],
            ['name' => 'Class 15', 'section' => 'A', 'class_teacher_id' => '12',    'capacity' => 62],
        ];


        DB::table('rooms')->insert($rooms);
    }
}
