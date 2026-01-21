<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Student; 
use Faker\Factory as Faker;
use Illuminate\Support\Facades\Hash;

class StudentSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $faker = Faker::create();

        $rollCounters = [];

        for ($i = 1; $i <= 100; $i++) {

            $classId = $faker->numberBetween(1, 5);

            if (!isset($rollCounters[$classId])) {
                $rollCounters[$classId] = 1;
            } else {
                $rollCounters[$classId]++;
            }

            Student::create([
                'first_name'       => $faker->firstName,
                'last_name'        => $faker->lastName,
                'dob'              => $faker->date(),
                'gender'           => $faker->randomElement(['Male', 'Female', 'Other']),
                'blood_group'      => $faker->randomElement(['A+', 'A-', 'B+', 'B-', 'O+', 'O-', 'AB+', 'AB-']),

                'religion'         => $faker->randomElement(['Islam', 'Hindu', 'Christian', 'Buddhist', 'Other']),
                'nationality'      => 'Bangladeshi',

                'national_id'      => $faker->unique()->numerify('#############'),
                'contact_number'   => '01' . $faker->numberBetween(300000000, 999999999),

                'email'            => 'student'.$i.'@example.com',
                'password'         => Hash::make('123456789'),

                'address1'         => $faker->address,
                'address2'         => $faker->address,

                // Academic
                'admission_no'      => 'ADM-' . str_pad($i, 5, '0', STR_PAD_LEFT),
                'admission_date'    => $faker->date(),
                'section'           => $faker->randomElement(['A', 'B', 'C']),
                'group'             => $faker->randomElement(['Science', 'Arts', 'Commerce']),
                'session_year'      => "2025-2026",
                'previous_school'   => $faker->company . ' School',

                // father
                'father_name'       => $faker->name('male'),
                'father_profession' => $faker->randomElement(['Teacher', 'Farmer', 'Businessman', 'Doctor', 'Engineer']),
                'father_contact'    => '01' . $faker->numberBetween(300000000, 999999999),
                'father_email'      => 'father'.$i.'@example.com',
                'father_nid'        => $faker->unique()->numerify('#############'),

                // mother
                'mother_name'       => $faker->name('female'),
                'mother_profession' => $faker->randomElement(['Housewife', 'Teacher', 'Nurse', 'Doctor', 'Businesswoman']),
                'mother_contact'    => '01' . $faker->numberBetween(300000000, 999999999),
                'mother_email'      => 'mother'.$i.'@example.com',
                'mother_nid'        => $faker->unique()->numerify('#############'),

                // guardian
                'guardian_name'         => $faker->name,
                'guardian_contact'      => '01' . $faker->numberBetween(300000000, 999999999),
                'guardian_email'        => 'guardian'.$i.'@example.com',
                'guardian_nid'          => $faker->unique()->numerify('#############'),
                'guardian_relationship' => $faker->randomElement(['Uncle', 'Aunt', 'Grandparent', 'Brother', 'Sister']),

                // Class info
                'class_id'    => $classId,
                'roll_number' => $rollCounters[$classId],
                'status'      => 1,
                'attend_date' => now(),

                // Board
                'b_reg_no'  => 2025000000 + $i,
                'b_roll_no' => 900000 + $i,

                // System
                'email_verified_at'    => now(),
                'last_login_at'        => now(),
                'last_login_ip'        => '127.0.0.1',
                'is_profile_completed' => true,

            ]);
        }
    }
}
