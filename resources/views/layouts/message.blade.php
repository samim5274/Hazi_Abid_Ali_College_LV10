@if(Session::has('success'))
<div id="popup" 
     class="fixed top-20 right-5 opacity-0 bg-green-500 text-white px-6 py-3 rounded-lg shadow-lg transform translate-y-10 transition-all duration-500 ease-in-out">
    {{ Session::get('success') }}
</div>
@endif

@if(Session::has('error'))
<div id="popup" 
     class="fixed top-20 right-5 opacity-0 bg-red-500 text-white px-6 py-3 rounded-lg shadow-lg transform translate-y-10 transition-all duration-500 ease-in-out">
    {{ Session::get('error') }}
</div>
@endif

@if(Session::has('warning'))
<div id="popup" 
     class="fixed top-20 right-5 opacity-0 bg-yellow-500 text-black px-6 py-3 rounded-lg shadow-lg transform translate-y-10 transition-all duration-500 ease-in-out">
    {{ Session::get('warning') }}
</div>
@endif

@if ($errors->any())
<div id="popup" 
     class="fixed top-20 right-5 opacity-0 bg-red-500 text-white px-6 py-3 rounded-lg shadow-lg transform translate-y-10 transition-all duration-500 ease-in-out">
    <ul class="list-disc list-inside">
        @foreach ($errors->all() as $error)
            {{ $error }}
        @endforeach
    </ul>
</div>
@endif