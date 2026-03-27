<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;

class UserController extends Controller
{
    /**
     * 顯示所有使用者的列表
     */
    public function index()
    {
        return User::all();
    }

    /**
     * 新增新使用者
     */
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:users',
        ]);

        // 生成隨機密碼
        $password = Str::random(12);

        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => Hash::make($password),
        ]);

        return response()->json([
            'user' => $user,
            'generated_password' => $password, // 實際應用中不要返回密碼
        ], 201);
    }
}