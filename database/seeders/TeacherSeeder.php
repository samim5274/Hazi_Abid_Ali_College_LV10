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
                'first_name'  => $faker->firstName,
                'last_name'   => $faker->lastName,
                // realistic dob: 25-60 years old
                'dob'         => $faker->dateTimeBetween('-60 years', '-25 years')->format('Y-m-d'),
                'gender'      => $faker->randomElement(['Male', 'Female']),
                'blood_group' => $faker->randomElement(['A+', 'A-', 'B+', 'B-', 'O+', 'O-', 'AB+', 'AB-']),
                'national_id' => $faker->unique()->numerify('#############'),
                'contact_number' => '01' . $faker->numberBetween(300000000, 999999999),
                'email'       => 'teacher'.$i.'@example.com',
                'password'    => Hash::make('123456789'),
                'designation' => $faker->randomElement(['Lecturer', 'Assistant Professor', 'Senior Teacher', 'Head of Department']),
                'address'     => $faker->address,

                'father_name'    => $faker->name('male'),
                'father_contact' => '01' . $faker->numberBetween(300000000, 999999999),
                'mother_name'    => $faker->name('female'),
                'mother_contact' => '01' . $faker->numberBetween(300000000, 999999999),

                'guardian_name'         => $faker->name,
                'guardian_contact'      => '01' . $faker->numberBetween(300000000, 999999999),
                'guardian_relationship' => $faker->randomElement(['Uncle', 'Aunt', 'Grandparent', 'Brother', 'Sister']),

                'status' => 1,
                'remark' => 'N/A',

                'role' => 'Admin',

                // system fields
                'email_verified_at'    => now(),
                'last_login_at'        => now(),
                'last_login_ip'        => '127.0.0.1',
                'is_profile_completed' => true,
            ]);

            $start++;
        }
    }
}
