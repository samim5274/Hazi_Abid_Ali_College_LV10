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

        for ($i = 1; $i <= 300; $i++) {

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
                'national_id'      => $faker->numerify($i++),
                'contact_number'   => $faker->phoneNumber,
                'email'            => 'student'.$i.'@example.com',
                'password'         => Hash::make('123456789'),
                'address1'         => $faker->address,
                'address2'         => $faker->secondaryAddress,

                'father_name'       => $faker->name('male'),
                'father_profession' => $faker->randomElement(['Teacher', 'Farmer', 'Businessman', 'Doctor', 'Engineer']),
                'father_contact'    => $faker->phoneNumber,
                'father_email'      => 'student'.$i.'@example.com',
                'father_nid'        => $faker->numerify($i++),
                'father_monthly_income' => $faker->numerify($i++),

                'mother_name'       => $faker->name('female'),
                'mother_profession' => $faker->randomElement(['Housewife', 'Teacher', 'Nurse', 'Doctor', 'Businesswoman']),
                'mother_contact'    => $faker->phoneNumber,
                'mother_email'      => 'student'.$i.'@example.com',
                'mother_nid'        => $faker->numerify($i++),
                'mother_monthly_income' => $faker->numerify($i++),

                'guardian_name'         => $faker->name,
                'guardian_contact'      => $faker->phoneNumber,
                'guardian_email'        => 'student'.$i.'@example.com',
                'guardian_nid'          => $faker->numerify($i++),
                'guardian_relationship' => $faker->randomElement(['Uncle', 'Aunt', 'Grandparent', 'Brother', 'Sister']),

                'b_reg_no'              => '0000'.$i,
                'b_roll_no'              => '929904'.$i,

                'status'          => 1, // active
                'roll_number'     => $rollCounters[$classId], // sequential roll per class
                'class_id'        => $classId,
                'attend_date'     => '2025-11-18',
                'remark'          => 'N/A',
            ]);
        }
    }
}
