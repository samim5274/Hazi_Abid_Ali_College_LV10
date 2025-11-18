<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Teacher; 
use Faker\Factory as Faker;
use Illuminate\Support\Facades\Hash;

class TeacherSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $faker = Faker::create();
        $start = 1;

        for ($i = 0; $i < 30; $i++) {
            Teacher::create([
                'first_name'       => $faker->firstName,
                'last_name'        => $faker->lastName,
                'dob'              => $faker->date('Y-m-d', '1990-01-01'), // realistic teacher age
                'gender'           => $faker->randomElement(['Male', 'Female', 'Other']),
                'blood_group'      => $faker->randomElement(['A+', 'A-', 'B+', 'B-', 'O+', 'O-', 'AB+', 'AB-']),
                'national_id'      => $faker->unique()->numerify($i++),
                'contact_number'   => $faker->unique()->phoneNumber,
                'email'            => 'teacher'.$start.'@example.com',
                'password'         => Hash::make('123456789'),
                'designation'      => $faker->randomElement(['Lecturer', 'Assistant Professor', 'Senior Teacher', 'Head of Department']),
                'address'          => $faker->address,

                'father_name'       => $faker->name('male'),
                'father_contact'    => $faker->phoneNumber,
                'mother_name'       => $faker->name('female'),
                'mother_contact'    => $faker->phoneNumber,
                'guardian_name'         => $faker->name,
                'guardian_contact'      => $faker->phoneNumber,
                'guardian_relationship' => $faker->randomElement(['Uncle', 'Aunt', 'Grandparent', 'Brother', 'Sister']),

                'status'          => 1, // active
                'remark'          => 'N/A',
            ]);

            $start++;
        }
    }
}
