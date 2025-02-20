<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Redirect;

class BankController extends Controller
{
    public function transfert(Request $request)
    {
        if ($request->user()->money >= $request->money)
        {
            $account = User::where("email", $request->email)->firstOrFail();
            $account->update([
                "money" => $account->money + $request->money
            ]);
            $request->user()->update([
                "money" => $request->user()->money - $request->money
            ]);
            return Redirect::back();
        }
        else { abort(400); }
    }
}
